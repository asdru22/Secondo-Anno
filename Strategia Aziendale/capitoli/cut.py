import PyPDF2

def split_pdf(input_pdf_path, output_dir, page_ranges):
    with open(input_pdf_path, 'rb') as pdf_file:
        pdf_reader = PyPDF2.PdfReader(pdf_file)
        
        for i, page_range in enumerate(page_ranges):
            start_page, end_page = page_range
            if start_page < 1 or end_page > len(pdf_reader.pages) or start_page > end_page:
                print(f"Invalid page range for PDF {i + 1}: {start_page}-{end_page}")
                continue
            
            pdf_writer = PyPDF2.PdfWriter()
            for page_num in range(start_page - 1, end_page):
                page = pdf_reader.pages[page_num]
                pdf_writer.add_page(page)
            
            output_pdf_path = f"{output_dir}/capitolo_{i + 100}.pdf"
            with open(output_pdf_path, 'wb') as output_pdf_file:
                pdf_writer.write(output_pdf_file)
                print(f"PDF {i + 1} created: {output_pdf_path}")

if __name__ == '__main__':
    input_pdf_path = 'libro.pdf'  # Replace with the path to your input PDF
    output_dir = 'capitoli'    # Replace with the directory where you want to save the output PDFs

    # Specify the page ranges for each output PDF as a list of tuples (start_page, end_page)
    page_ranges = [(388, 404),(405,425),(426,445),(297,318),(319,329)]  # Example page ranges

    split_pdf(input_pdf_path, output_dir, page_ranges)