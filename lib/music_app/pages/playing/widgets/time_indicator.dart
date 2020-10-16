import 'package:flutter/material.dart';
import 'package:flutter_samples/music_app/bloc/music_player_bloc.dart';
import 'package:flutter_samples/music_app/utils/constans.dart';
import 'package:provider/provider.dart';

class TimeAndIndicator extends StatelessWidget {
  const TimeAndIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 2.75,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: LayoutBuilder(builder: (_, constrains) => _Indicator()),
      ),
    );
  }
}

class _Indicator extends StatefulWidget {
  const _Indicator({Key key}) : super(key: key);

  @override
  __IndicatorState createState() => __IndicatorState();
}

class __IndicatorState extends State<_Indicator> {
  ValueNotifier<double> _sliderValue = ValueNotifier(0.0);
  bool _dragging = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final musicPlayerBloc =
          Provider.of<MusicPlayerBLoC>(context, listen: false);
      musicPlayerBloc.musicPlayer.position.addListener(() {
        if (_dragging == false) {
          _sliderValue.value =
              musicPlayerBloc.musicPlayer.position.value.inSeconds.toDouble();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final musicPlayer =
        Provider.of<MusicPlayerBLoC>(context, listen: false).musicPlayer;
    return ValueListenableBuilder(
      valueListenable: _sliderValue,
      builder: (_, value, __) {
        double max = 100;
        if (musicPlayer.duration != null) {
          max = musicPlayer.duration.inSeconds.toDouble();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) => LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [value / max, value / max],
                      colors: [
                        MusicAppColors.bluePurple,
                        Color(0xFFFFFFF).withOpacity(.85),
                      ],
                    ).createShader(rect),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.asset(
                                    'assets/images/music_app/waveform.png')
                                .image),
                      ),
                    ),
                  ),
                  AbsorbPointer(
                    absorbing: musicPlayer.loading,
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 0,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                      ),
                      child: Slider(
                        min: 0,
                        max: max,
                        value: value,
                        label:
                            '${formatTime(Duration(seconds: value.toInt()))}',
                        divisions: 100,
                        onChangeStart: (_) => _dragging = true,
                        onChangeEnd: (_) {
                          _dragging = false;
                          musicPlayer.seekTo(Duration(seconds: value.toInt()));
                        },
                        onChanged: (value) {
                          _sliderValue.value = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: musicPlayer.position,
              builder: (_, position, __) => _IndicatorTime(
                  percent: value / max, text: '- ${formatTime(position)}'),
            ),
          ],
        );
      },
    );
  }
}

class _IndicatorTime extends StatelessWidget {
  const _IndicatorTime({Key key, this.percent, this.text}) : super(key: key);
  final double percent;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final offset = size.width - 130;
    return Transform.translate(
      offset: Offset(offset * (percent + (.05 * percent)), 0),
      child: Container(
        decoration: BoxDecoration(
            color: MusicAppColors.bluePurple,
            borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child: Text(
          text,
          style: Theme.of(context).textTheme.caption.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
        ),
      ),
    );
  }
}
