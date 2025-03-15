# How does the Transformer work

## Encoder part of a transformer

1. Word embeddings:
    - Each token (word) of the input sentence is converted into it's vector (numerical value, embedding).
    - Numerical Vector representation is generated for each input word through a "pre trained" neural network.
    - Words with similar meaning tend to have the same vector values if you think about the representation in a space of co-ordinates.
    - The difference in the vector of 2 words gives out a vector which represents the relationship between the 2 words.
    - In models like GPT, words are represented as high-dimensional vectors in an embedding space. The difference between two word vectors often captures semantic and syntactic relationships.
    - Cosine similarity between two vectors often reflects their semantic closeness.
    - In GPT-3, each vector is of 12288 dimensions.
2. Positional encoding
    - allows a Transformer to keep track of the word order
3. Self-Attention:
    - Transformers have something called self-attention which is a mechanism to correctly associate the relationship between words in the sentence.
    - For example, for the sentence "The pizza came out of the oven and it tasted great", if you look at a lot of sentences with the word "pizza" and the word "it", "it" is more commonly associated with pizza than oven, then the similarity score for pizza will cause it to have a larger impact on how the word "it" is encoded by the Transformer.
    - The self-attention layer allows every word in the input to look at and compare itself to every other word in the sentence and absorb the meaning from the most relevant words to better capture the context of its intended use in that sentence.
    - Generate query vector, key vector for each of the word. Now we use them to calculate the similarities of each word with all the other words in the sentence. The query vector of each word is asking which words am I related to and the key vector is answering it.
    - Conceptually, you want to think of the keys as potentially answering the queries. You think of the keys as matching the queries whenever they closing align with each other.
    - For this, the dot product of the Query of a word is calculated with the key of all the other words, and the output for each word is run through softmax function to make it between 0 and 1.
    - Also, the embeddings for each word is converted into Values through, YANN (Yet another neural network). You might think of it as saying if this word is relevant to adjusting the meaning of something else, what exactly should be added to the embedding of that something else. For eg. In the sentence blue fluffy creature, you add the vector that represents blue fluffy.
    - The softmax output for each word and the Value for all other words is multiplied (n by n), to give out the self-attention (vector) values for each word.
    - Masked self-attention works by seeing how similar each word is to itself and all of the preceeding words (not after) in a sentence.
    - There could be many Stack of Masked self-attention layers (Multi-head), each with different weights (YANN), this is to capture different relationships between each words. In GPT-3 there were 96 attention heads.
    - In GPT-3, each K, Q vector is of 128 dimensions.
    - Multiplying K and Q (say E) deduces which words are relevant to which other words.
    - Now you need to actually update the embeddings allowing words to pass information to whichever other words they are relevant to. For example you want the embedding of fluffy to somehow cause a change to Create that moves it to a different part of this 12000 dimensional embedding space that more specifically encodes a Fluffy creature.
4. MLP (Multi Layer Perceptron)
    - The embedding, after the self-attention layer is passed through a Multi-layer perceptron.
    - This is where more information is added to the embeddings of each word. Eg. If the embedding contains the words Michael Jordan, then these MLPs add the information (vector values) about Basketball.
    - The MLP does not "add" information explicitly—it transforms embeddings in a way that helps the model recognize patterns.
    - The association between "Michael Jordan" and "Basketball" comes from training data, not a specific "add" operation.
    - Note: The dot-product of the vector-embeddings of Michael and Basketball will be 1 if they align, else 0 or negative.
5. Prediction through Linear pass
    - The embedding is then passed into the linear layer (vec2word) to predict the next word.

## In Decoder only transformer

- In the decoder-only transformer, the process remains the same up to this point, including self-attention, residual connections & MLP.
- Next, the subsequent words are predicted using the transformed vector for each word. This prediction is done by passing the vectors through a fully connected neural network, often referred to as a feed-forward neural network. If there are 50,000 possible words in the vocabulary, the network outputs a probability distribution over all possible words.
- This step is essentially the inverse of the initial word embedding process, mapping the transformed vectors back to words in the vocabulary.
- For each new word generated, we calculate it's encoding, positional encoding, K, Q, V and apply masked attention with the K & V of all the words that have preceeded. Then again we pass the final vector through the same fully connected neural network to predict the next word until the next word is the \<EOS\> token.

## In Encoder-Decoder only transformer

- When encoding the input prompt, instead of using the Masked self attention, a normal Transformer uses Self-attention, which includes all the words in the input, not just the ones that came before to determine how the words are related to each other.
- It uses an Encoder-decoder attention to let the decoder keep track of the important words in the input.
- Uses Queries from the decoder, but only keys and values from the encoder.

---

## EDITED: In Decoder only transformer

In a decoder-only transformer, the process begins with token embeddings and positional encodings added to provide positional context. Each input sequence is processed through a series of decoder blocks, which include masked self-attention layers, feed-forward layers, and residual connections.

For generating text, the model predicts the next word based on the transformed vector for the current sequence. The prediction step involves passing the final output vector through a fully connected layer, followed by a softmax function, to produce a probability distribution over the vocabulary. If there are 50,000 possible words, this distribution spans all words in the vocabulary.

During generation, causal masking ensures that the decoder only attends to tokens up to the current position, avoiding any "leakage" of future tokens. Each newly generated word is appended to the input sequence, and the process is repeated. Positional encodings and masked self-attention are recalculated for the updated sequence, but key and value pairs from previous tokens can be cached for efficiency.

The same vocabulary projection layer and feed-forward neural network are reused for every token in the sequence. This process continues until the model predicts the \<EOS\> token, signaling the end of the sequence.
