FROM python:3.9-alpine

COPY LICENSE \
        README.md \
        entrypoint.sh \
        requirements.txt \
        dest/

RUN pip install --pre -r /dest/requirements.txt

RUN chmod +x /dest/entrypoint.sh
ENTRYPOINT ["/dest/entrypoint.sh"]
CMD []