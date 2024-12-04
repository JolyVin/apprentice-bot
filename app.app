from flask import Flask, request, jsonify
import openai

app = Flask(__name__)

openai.api_key = 'your-openai-api-key'  # Replace with your OpenAI API key

@app.route('/')
def home():
    return 'Welcome to the Apprentice Bot!'

@app.route('/ask', methods=['POST'])
def ask():
    user_input = request.json.get('input')
    response = openai.Completion.create(
        engine="text-davinci-003",  # Or another model like gpt-4 if you have access
        prompt=user_input,
        max_tokens=150
    )
    return jsonify({'response': response.choices[0].text.strip()})

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
