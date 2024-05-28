# Function to check if the file is an image
is_image() {
    mimetype=$(file -b --mime-type "$1")
    [[ $mimetype == image/* ]]
}

# Function to check if the file is a PDF
is_pdf() {
    mimetype=$(file -b --mime-type "$1")
    [[ $mimetype == application/pdf ]]
}

# Check if the correct number of arguments is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"

# Check if the file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found."
    exit 1
fi

# Check if the file is an image
if is_image "$input_file"; then
    # Run Tesseract OCR
    echo "Performing OCR using Tesseract..."
    tesseract "$input_file" output_text
    echo "OCR completed. Output saved to 'output_text.txt'"
elif is_pdf "$input_file"; then
    # Run ocrmypdf for PDF OCR
    echo "Performing OCR using ocrmypdf..."
    ocrmypdf "$input_file" "${input_file%.pdf}_ocr.pdf"
    echo "OCR completed. Output saved to '${input_file%.pdf}_ocr.pdf'"
else
    echo "Error: Unsupported file format. Supported formats: image, pdf."
    exit 1
fi

