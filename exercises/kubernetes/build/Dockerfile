FROM python:2.7 			# Base Image
COPY . /app 				# Copy files to image, SRC(host) DEST(image)
WORKDIR /app				# Set workdir/homedir
RUN pip install -r requirements.txt 	# Run command inside container
ENTRYPOINT ["python"] 			# Command to run on startup
CMD ["app.py"] 				# Arguments to command
