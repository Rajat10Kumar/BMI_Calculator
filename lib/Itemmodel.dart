import 'items.dart';

class ItemModel {
  List<Item> _itemData = <Item>[
    Item(
      expanded: false,
      headerItem: 'What is BMI?',
      description:
          "Body Mass Index (BMI) is a measurement of a person’s weight with respect to his or her height."
          " It is more of an indicator than a direct measurement of a person’s total body fat.",
    ),
    Item(
      expanded: false,
      headerItem: 'How BMI is calculated?',
      description:
          "Your BMI is a measurement that is a ratio of your weight and height. "
          "It's a good way to gauge whether your weight is in healthy proportion to your height. ",
    ),
    Item(
      expanded: false,
      headerItem: 'What WHO says about BMI ?',
      description:
          "The WHO defines an adult who has a BMI between 25 and 29.9 as overweight"
          " - an adult who has a BMI of 30 or higher is considered obese - a BMI below 18.5 is considered underweight,"
          " and between 18.5 to 24.9 a healthy weight .",
    ),
    Item(
      expanded: false,
      headerItem: 'What are disadvantages of High BMI?',
      description:
          "The higher your BMI, the higher your risk for certain diseases such as heart disease,"
          " high blood pressure, type 2 diabetes, gallstones, breathing problems, and certain cancers.",
    ),
    Item(
      expanded: false,
      headerItem: 'Why do we need to know our BMI ?',
      description: "Knowing your BMI can help you – "
          "and your Growth Progress – "
          "determine any health risks you may face if it's outside of the healthy range.",
    ),
    Item(
        expanded: false,
        headerItem: 'Do Doctors use BMI ?',
        description:
            "Body mass index, or BMI, has been used for over 100 years to help health professionals "
            "decide whether a patient is overweight or underweight."
            " It is used in population studies, by doctors, personal trainers, and others."),
    Item(
        expanded: false,
        headerItem: 'What is ideal BMI ?',
        description:
            "For most adults, an ideal BMI is in the 18.5 to 24.9 range."
            " For children and young people aged 2 to 18, "
            "the BMI calculation takes into account age and gender as well as height and weight."),
    Item(
        expanded: false,
        headerItem: 'What happens if your BMI is too low ?',
        description:
            "Weighing too little can contribute to a weakened immune system, fragile bones and feeling tired."
            " You can check if you're underweight by using our BMI healthy weight calculator, "
            "which shows your body mass index (BMI)."
            " If your BMI is below 18.5, this suggests that your weight may be too low."),
    Item(
        expanded: false,
        headerItem: 'Does age affect my BMI ?',
        description:
            "For adults ages 20 years and older, BMI incorporates weight and height, but it does not take age or sex into account."
            " A woman tends to have more body fat than a man with the same BMI."
            " Likewise, an older person tends to have more body fat than a younger person with an equal BMI."),
    Item(
        expanded: false,
        headerItem: 'What are the advantages of BMI ?',
        description: 'As stated, BMI helps measure the obesity rate in people.'
            ' Observing the changes in BMI values help the doctors evaluate the obesity levels in people over time.'),
    Item(
        expanded: false,
        headerItem: 'Best BMI for man and woman ?',
        description:
            "A BMI of 18.5–24.9 is considered normal or healthy for most woman and man."),
  ];
  List<Item> getItems() {
    return _itemData;
  }
}
