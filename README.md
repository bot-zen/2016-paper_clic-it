# bot.zen @ EVALITA 2016 - A minimally-deep learning PoS-tagger (trained for Italian Tweets)

# Abstract

This article describes the system that participated in the POS tagging for
Italian Social Media Texts (PoSTWITA) task of the 5th periodic evaluation
campaign of Natural Language Processing (NLP) and speech tools for the Italian
language EVALITA 2016.

The system combines a small assertion of trending techniques, which implement
matured methods, from NLP and ML to achieve competitive results on PoS tagging
of Italian Twitter texts; in particular, the system uses word embeddings and
character-level representations of word beginnings and endings in a LSTM RNN
architecture.  Labelled data (Italian UD corpus, DiDi and PoSTWITA) and
unlabbelled data (Italian C4Corpus and PAISÀ) were used for training.

The system is available under the APLv2 open-source license.
