{
  "json_schema_version" : "1.0.0",
  "input_preproc": [
    {
      "layer_name": "data",
      "color_format": "BGR"
    }
  ],
  "output_postproc": [
    {
      "layer_name": "prob_emotion",
      "attribute_name": "emotion",
      "labels": ["neutral", "happy", "sad", "surprise", "anger" ],
      "converter": "tensor_to_label",
      "method": "max"
    }
  ]
}
