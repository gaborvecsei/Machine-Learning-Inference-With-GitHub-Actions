import argparse
import numpy as np
import pickle


def parse_comment_input(comment: str) -> list:
    # Valid comment should look like this: '/predict <float> <float> <float> <float>'
    #  The order of the 4 float numbers: sepal_length, sepal_width, petal_length, petal_width
    comment_list = comment.split(" ")
    if len(comment_list) != 5:
        raise ValueError(
            "The comment can not be parsed. Wrong format. It should be: \'/predict <float> <float> <float> <float>\'")
    parsed_numbers = list(map(float, comment_list[1:]))
    return parsed_numbers


def load_model(model_path: str):
    with open(model_path, 'rb') as file:
        model = pickle.load(file)
    return model


def make_prediction(model, sepal_length: float, sepal_width: float, petal_length: float, petal_width: float) -> int:
    x = np.array([[sepal_length, sepal_width, petal_length, petal_width]])
    pred = model.predict(x)[0]
    return pred


def map_class_id_to_name(class_id: int) -> str:
    class_id_to_name_dict = {0: "Setosa", 1: "Versicolor", 2: "Virginica"}
    return class_id_to_name_dict[class_id]


parser = argparse.ArgumentParser()
parser.add_argument("--issue_number", required=True)
parser.add_argument("--issue_comment_body", required=True)
parser.add_argument("--issue_user", required=True)
args = parser.parse_args()

model = load_model("/random_forest_model.pkl")

try:
    sepal_length, sepal_width, petal_length, petal_width = parse_comment_input(args.issue_comment_body)
    predicted_class_id = make_prediction(model, sepal_length, sepal_width, petal_length, petal_width)
    predicted_class_name = map_class_id_to_name(predicted_class_id)
    reply_message = f"Hey @{args.issue_user}!<br>This was your input: {args.issue_comment_body}.<br>The prediction: **{predicted_class_name}**"
except Exception as e:
    reply_message = f"Hey @{args.issue_user}! There was a problem with your input. The error: {e}"

print(f"::set-output name=issue_comment_reply::{reply_message}")
