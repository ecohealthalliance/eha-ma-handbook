# Assembly of high throughput data

In this chapter the two main approaches to the assembly of biological sequences will be presented.

Some introductory documentation

[- A bit of de Bruijn graph history](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5531759/#:~:text=Short%20read%20sequencing%20technologies%20produce,longer%20than%20the%20read%20length.)


[- MEGAHIT publication](https://doi.org/10.1093/bioinformatics/btv033)

### The problem

The figure 1 presents the challenges faced by assembly algorithms. Current second and third generation sequencing technologies produce fragments of genomes, called reads that can vary from a few hundred to kilobases, depending on the technology. Ideally, these reads could cover the complete genome sequence. However, both technical problems and the complexity of the biological data lead to gaps and reductions in the overall size of the assembly. Among the biological factors, the heterozygous diploid genomes, the abundance and extension of the repeats; the nucleotide variation hinder the assembly process. However, the main problem is to recover most of the genome from millions of reads with a reasonable use of time and resources. An elegant and efficient solution to this problem particularly suitable for short reads, is the Bruijn graph.

### Graphs

A solution to the assembly problem is represented by graphs. Graphs are a mathematical notion that is widely applied to various biological, ecological, and evolutionary problems. Formally, a graph is a mathematical structure composed of nodes and vertices. The nodes are related to each other by the vertices. Figure 2 is an example of a graph; in this example, numbers are found at the nodes, while the vertices represent relationships between these nodes.

![image](https://user-images.githubusercontent.com/72785049/224148769-76f54213-ebe3-4bb3-958d-4abbc8b7fecc.png)
  
  Figure 2. Graph
  
  https://en.wikipedia.org/wiki/Graph_theory
           
           
           
           

#### Why are graphs a good strategy to assemble biological sequences? 

Graphs take advantage of sequencing redundancy. Due to the overlapping between the sequences of the reads, it is possible to establish relations between the reads. In the example presented in the figure 3, reads 1, 2 and 3 share part of the sequence; this type of overlap is used by the graphs to relate the reads during the assembly process. In other words, graphs represent overlaps between reads.

![image](https://user-images.githubusercontent.com/72785049/224151798-74cca062-5184-4b61-ab84-b75dee634729.png)
Figure 3. Overlap between reads. Nucleotides shared between reads are in bold. 

### Bruijn graph

There are different types of graphs with particular properties. The de Bruijn graph presents some properties that guarantee to always find the genomic sequence from the reads. Initially, we will make an intuitive introduction to de Bruijn graphs before doing a more formal presentation. Before introducing the de Bruijn graph, we will present an essential concept of this type of graph, the k-mer. The k-mer are words of size K observed in a sequence identified through a sliding window (with a step of 1),(Figure 4). 

<img width="599" alt="image" src="https://user-images.githubusercontent.com/72785049/224171720-dbc4b9aa-0aa9-4e7a-b98a-c8c51f343772.png">

Figure 4. K-mer example. All K-mers of size 6 of a small genome are shown. 

####  How to build a de Bruijn graph?

A de Bruijn graph for a fixed interger K:

1. Nodes = all k-mers (substrings of length k) present in the
reads.
2. There is an edge between x and y if the (k-1)-mer prefix
of y matches exactly the (k-1)-mer suffix of x.

#### Examples

1. Genome : ACTG

K-mers for K=3: ACT, CTG

Bruijn graph : ACT -> CTG

Why?

<img width="176" alt="image" src="https://user-images.githubusercontent.com/72785049/224162893-88ce7af8-e9a4-4779-af14-4585881324d5.png">

2. A second example with several reads        

<img width="467" alt="image" src="https://user-images.githubusercontent.com/72785049/224167227-085a4baa-2020-47ea-88c9-1fd3f56e6b68.png">

**Exercises** 

What are the de Bruijn graphs of the following reads, you can use a k-mer of 3:

a.  ACTG, CTGC, CTGA, TGCC

b.  AGCCTGA, AGCATGA 


### Contigs


Different factors can complicate the construction of de Bruijn graphs; Biological factors include sequence variations that may occur in some samples, for example in virus sequences or heterozygosity or polyploidy in plants. As we mentioned before, the frequency and length of the repetitions is another factor that has significant effects on the assembly process. In addition, sequencing errors reduce the chances of obtaining whole genomes. The previous exercises showed that these factors produce branching paths in the de Bruijn graph. Most assembly software does not face the dilemma of choosing between different paths and they cut the graph into disjoint components. These partial genome sequences are called contigs. Contigs are defined as unique paths in the de Bruijn graph that do not share nodes with other paths. The following figure is an example of contigs, or disjoint paths, in a de Bruijn graph:

<img width="563" alt="image" src="https://user-images.githubusercontent.com/72785049/228941981-0737833b-7302-421d-9725-ef62c0f42d8e.png">

The figure shows that none of the contigs share nodes and represent partial sequences of the same genome.

### A formal presentation of de Bruijn graphs

The de Bruijn graphs represent an important advance in the assembly of genomes. The first bacterial genomes and the [human genome](https://doi.org/10.1038/35057062) were assembled with a different strategy. In this strategy, the nodes represented the reads and the edges represented the overlap (shared sequence) between the nodes. This strategy was developed for the relatively long sequences obtained with the Sanger technology. In this approach, the genomes were assembled by finding a Hamiltonian path in the graph. A [Hamiltonian path](https://doi.org/10.1007/BF01188580) is defined by visiting each of the nodes once, returning to the starting point or initial node. This method involves aligning each of the reads against all other reads. This last point is the main limitation of this strategy; from the computational point of view, this is an NP-Complete problem. This means that the time required to align all the reads in an assembly is polynomially related to the number of reads. Therefore the assembly of genomes from millions of short reads with the Hamiltonian cycle is not tractable.

In response to this major limitation, in the early 2000s, [Pevzner](https://doi.org/10.1073/pnas.171285098) proposed de Bruijn graphs as a practical solution to assembling genomes from millions of short reads. So far an intuitive introduction to de Bruijn graphs has been made, now some formalization is necessary. We will assume that our de Bruijn graph is directed and connected, this means that the edges have a direction when relating two different nodes and that each node could be reached by another node, respectively (Figure below). We will also assume that our graph is balanced, this means that the number of edges that arrive at a node (indegree) is equal to the number of edges that left this same node (outdegree), and that this is true for all the nodes of the graph. [Euler](https://scholarlycommons.pacific.edu/euler-works/53/) showed that there is a unique solution (unique path), in which each of the edges of a graph is visited once from an initial point. This unique solution represents the genome. The de Bruijn graph represents a major advance in the assembly of genomes because unlike the Hamiltonian solution, the Eulerian path does not imply the alignment of the reads. Although a plausible solution, the Eulerian cycle presents certain limitations, of which the most important is the memory size required for the storage of the graph. In addition, sequencing errors and biological variability and repeats prevent, in many cases, obtaining a single genomic sequence. Currently there are different software that apply the algorithmic concepts of the Eulerian cycle to assemble genomes from different types of high throughput sequences. Megahit, which is an example of this kind of software, will be presente below. But first we will discuss a bit about the importance of the size of the k-mer.

![image](https://user-images.githubusercontent.com/72785049/231560711-c1fe6161-6619-4fe8-8785-a8959745b13f.png)

[A de Bruijn graph, directed, connected and balanced](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://www.cs.jhu.edu/~langmea/resources/lecture_notes/assembly_dbg.pdf)

### MEGAHIT

[Github](https://github.com/voutcn/megahit)

The tool that we will use for *de novo* assembly of genomes is [MEGAHIT](https://doi.org/10.1093/bioinformatics/btv033). In our experience, MEGAHIT has presented the best balance in the assembly procces of genomic sequences from metagenomic data. MEGAHIT presents several advantages; this software works under the standard resources of most of the scientific computing clusters; MEGAHIT assembles sequences in a reasonable amount of time. MEGAHIT makes use of succinct de Bruijn graphs which is a compressed representation of Brujin graphs. This compression is based on the Burrows–Wheeler transformation zhich reduces the memory space needed to store the graph; an in-depth technical explanation of succinct de Bruijn graphs is given in this link. 

Before we address the installation and execution of MEGAHIT, we will highlight some of the options that we feel are important for running this software. The first one of these options is the minimum multiplicity of a k-mer for filtering (--min-count). This option specified the minimum multiplicity that a k-mer must have to be used in the assembly process. The idea behind this parameter is to remove k-mer with errors, once sequencing errors are rare events. However, it is possible that using this option, k-mer  of species or sequences with low abundances are removed. For this reason, MEGAHIT uses a heuristic that recovers some of these k-mers called mercy-kmer, which can be disabled from the command line (--no-mercy). Another set of options of major implication in the assembly are related to the k-mer size. A small k-mer size is favorable for filtering erroneous edges and filling gaps in low-coverage regions, a large k-mer size is useful for resolving repeats. It is for this reason that MEGAHIT uses k-mers of different sizes eliminating the different biases. Some of the parameters that control the size of k-mer in particular for metagenomic data can be specified with the --presets option.


## Installation

To install MEGAHIT we will use Conda

```
conda install -c bioconda megahit

```
## Running MEGAHIT

```
   megahit --presets meta-large --min-contig-len 200 -t 20 -1  R1.fastq  -2  R2.fastq  -r R1.unpaired.fastq,R2.unpaired.fastq 
   
   Options:
       --presets meta-large : '--k-min 27 --k-max 127 --k-step 10'
       --min-contig-len :  minimum length of contigs to output
       -t : number of CPU threads
       -1 : comma-separated list of fasta/q paired-end #1 files
       -2 : comma-separated list of fasta/q paired-end #2 files
       -r : comma-separated list of fasta/q single-end files
```

