FROM python:3.7

# Install python requirements
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Setup Docker entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Copy the trained model
COPY random_forest_model.pkl /random_forest_model.pkl

ENTRYPOINT ["/entrypoint.sh"]
