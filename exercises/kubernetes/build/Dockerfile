FROM python:2.7
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"] 		
CMD ["app.py"] 		
