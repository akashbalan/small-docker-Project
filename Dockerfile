# Use a lightweight Python base image
FROM python:3.11-slim

# Create app directory
WORKDIR /abc

# Install dependencies
COPY requirements.txt .
ADD requirements.txt .
ADD https://releases.hashicorp.com/terraform/1.9.0/terraform_1.9.0_linux_amd64.zip /var/www/html/

RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Expose Flask default port
#notes
EXPOSE 5000 

# ==============================
# Option 1: Development (simple Flask server)
# Uncomment this CMD if you want to run with python app.py
CMD ["python","app.py"]
# ENTRYPOINT ["python","app.py"]
# ENTRYPOINT ["python"]
# CMD ["app.py"]


