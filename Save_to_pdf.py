import os
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas

# Function to save text to a PDF file with a numbered filename
def save_to_numbered_pdf(text_content, output_folder="output_pdfs"):
    # Create an output folder if it doesn't exist
    os.makedirs(output_folder, exist_ok=True)

    # Get the list of existing PDF files in the output folder
    existing_pdfs = [file for file in os.listdir(output_folder) if file.endswith(".pdf")]

    # Determine the next available number for the new PDF filename
    next_number = len(existing_pdfs) + 1
    filename = f"output_{next_number}.pdf"

    # Create a PDF file
    output_path = os.path.join(output_folder, filename)
    with open(output_path, "wb") as pdf_file:
        c = canvas.Canvas(pdf_file, pagesize=letter)
        c.setFont("Helvetica", 12)
        c.drawString(10, 800, text_content)
        c.save()

    return output_path

# Example text content
example_text = "This is an example text content to be saved in a PDF file."

# Save the text to a PDF file with a numbered filename in the "output_pdfs" folder
pdf_path = save_to_numbered_pdf(example_text)
print(f"Text saved to PDF: {pdf_path}")
