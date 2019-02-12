%% Calculating and Visualizing Sequence Statistics
% This example shows basic sequence manipulation techniques and computes 
% some useful sequence statistics. It also illustrates how to look for 
% coding regions (such as proteins) and pursue further analysis of them. 

%   Copyright 2002-2015 The MathWorks, Inc.

%% The Human Mitochondrial Genome
% In this example you will explore the DNA sequence of the human 
% mitochondria. Mitochondria are structures, called organelles, that are
% found in the cytoplasm of the cell in hundreds to thousands for each
% cell. Mitochondria are generally the major energy production center in
% eukaryotes, they help to degrade fats and sugars. 

%%
% The consensus sequence of the human mitochondria genome has accession
% number NC_012920. You can |getgenbank| function to get the latest
% annotated sequence from GenBank(R) into the MATLAB(R) workspace.
%
%   mitochondria_gbk = getgenbank('NC_012920');

%%
% For your convenience, previously downloaded sequence is included in a
% MAT-file. Note that data in public repositories is frequently curated and 
% updated; therefore the results of this example might be slightly different
% when you use up-to-date datasets.

load mitochondria 

%%
% Copy just the DNA sequence to a new variable |mitochondria|. You can
% access parts of the DNA sequence by using regular MATLAB indexing
% commands.
mitochondria = mitochondria_gbk.Sequence;
mitochondria_length = length(mitochondria)
first_300_bases = seqdisp(mitochondria(1:300))

%%
% You can look at the composition of the nucleotides with the |ntdensity|
% function. 

figure
ntdensity(mitochondria)

%%
% This shows that the mitochondria genome is A-T rich. The GC-content is
% sometimes used to clsassify organisms in taxonomy, it may vary between
% different species from ~30% up to ~70%. Measuring GC content is also
% useful for identifying genes and for estimating the annealing temperature
% of DNA sequence.

%% Calculating Sequence Statistics
% Now, you will use some of the sequence statistics functions in the
% Bioinformatics Toolbox(TM) to look at various properties of the human
% mitochondrial genome. You can count the number of bases of the whole
% sequence using the |basecount| function. 

bases = basecount(mitochondria)

%%
% These are on the 5'-3' strand. You can look at the reverse complement
% case using the |seqrcomplement| function.

compBases = basecount(seqrcomplement(mitochondria))

%%
% As expected, the base counts on the reverse complement strand are
% complementary to the counts on the 5'-3' strand.  
%%
% You can use the chart option to |basecount| to display a pie chart of the
% distribution of the bases.

figure
basecount(mitochondria,'chart','pie');
title('Distribution of Nucleotide Bases for Human Mitochondrial Genome');


NC_018723.3 %(cat) this is the cat number from genebank
randseq(300) %this is generate randomseq like dna