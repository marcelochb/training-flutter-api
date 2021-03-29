import 'package:flutter/cupertino.dart';
import 'package:pocket/src/components/atoms/image/image_widget.dart';
import 'package:pocket/src/components/atoms/label/label_widget.dart';
import 'package:pocket/src/components/atoms/text/text_widget.dart';
import 'package:pocket/src/models/card_model.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({Key key, this.item, this.isBackgroundColorWhite = true})
      : super(key: key);
  final ModelOfCard item;
  final bool isBackgroundColorWhite;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageWidget(
                src: item.imageUrl,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelWidget(
                        text: 'Nome',
                        isBackgroundColorWhite: isBackgroundColorWhite),
                    TextWidget(
                        text: item.name,
                        isBackgroundColorWhite: isBackgroundColorWhite),
                    LabelWidget(
                        text: 'Artista',
                        isMargingTop: true,
                        isBackgroundColorWhite: isBackgroundColorWhite),
                    TextWidget(
                        text: item.artist,
                        isBackgroundColorWhite: isBackgroundColorWhite),
                    LabelWidget(
                        text: 'Tipo',
                        isMargingTop: true,
                        isBackgroundColorWhite: isBackgroundColorWhite),
                    TextWidget(
                        text: item.type,
                        isBackgroundColorWhite: isBackgroundColorWhite),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelWidget(
                  text: 'Descrição',
                  isBackgroundColorWhite: isBackgroundColorWhite),
              TextWidget(
                  text: item.text,
                  isBackgroundColorWhite: isBackgroundColorWhite)
            ],
          ),
        ),
      ],
    );
  }
}
