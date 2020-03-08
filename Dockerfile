FROM python:3.7

RUN pip install numpy scikit-learn

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY random_forest_model.pkl /random_forest_model.pkl

ENTRYPOINT ["/entrypoint.sh"]
