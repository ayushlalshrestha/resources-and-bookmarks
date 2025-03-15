# Models in Deep Learning

## Models

1. RNN - deal with sequence data where the input has a certain type of ordering

    - Vector-Sequence models which takes fixed size vector as input and outputs a sequence of any length. eg. pic to description.
    - Sequence-vector model: takes in sequence as input and outputs fixed vector eg. good/bad movie review
    - sequence to sequence: language translation

2. LSTM - Long short term memory cell
    - Input sequence has to be passed serially which makes it even slower

3. Transformers - Encoder decoder architecture
    - Input can be passed in parallely
    - 1st is the generation of Input embeddings i.e vectors representing a word
    - Positional encoder:
        - vector that gives context based on position of a word in the sentence.
        - Embedding of each word w.r.t other word + vector encoding of position in a sentence = embedding of a word
    - Encoder:
        Attention vector: 
            - What part of the input should we focus on?
            - Capture contextual relationship of each word with all the other words
            - Q = What am I looking for, K = What can I offer, V = What I actually offer
        Feed Forward:
            - Transform the attention vectors into a form that is digestable by the next encoder block or the decoder block

    - Decoder:
        - 1st layer is the "Masked" multi-head attention
        - 2nd layer is multi-head attention
        - Input is output shifted right, i.e feed previous outputs into decoder recurrently until an 'end-of-sequence' token is generated.
        - output from the 1st layer is inputted to the 2nd layer along with the ouput from the encoder for n.
