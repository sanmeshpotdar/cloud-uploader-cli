#!/bin/bash


show_help() {
    echo "Usage: upload_to_s3.sh [-b BUCKET] [-d DIRECTORY] FILE"
    echo ""
    echo "Options:"
    echo "  -b BUCKET      Specify the S3 bucket to upload to"
    echo "  -d DIRECTORY   Specify the directory in the S3 bucket (optional)"
    echo "  -h             Show this help message"
}

# Parse command line options
BUCKET=""
DIRECTORY=""

while getopts "hb:d:" opt; do
    case ${opt} in
        h)
            show_help
            exit 0
            ;;
        b)
            BUCKET=$OPTARG
            ;;
        d)
            DIRECTORY=$OPTARG
            ;;
        *)
            show_help
            exit 1
            ;;
    esac
done
shift $((OPTIND -1))

# Check if bucket is specified
if [ -z "$BUCKET" ]; then
    echo "Error: S3 bucket not specified"
    show_help
    exit 1
fi

# Check if file is specified
if [ $# -lt 1 ]; then
    echo "Error: No file specified"
    show_help
    exit 1
fi

FILE=$1

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found"
    exit 1
fi

# Upload file to S3
if [ -z "$DIRECTORY" ]; then
    aws s3 cp "$FILE" "s3://$BUCKET/"
else
    aws s3 cp "$FILE" "s3://$BUCKET/$DIRECTORY/"
fi

if [ $? -eq 0 ]; then
    echo "File '$FILE' successfully uploaded to 's3://$BUCKET/$DIRECTORY/'"
else
    echo "Error: Failed to upload file"
    exit 1
fi
