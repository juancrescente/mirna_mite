shortstack_path=ShortStack/
data_path=data/sRNASeq
genome_path=data/Triticum_aestivum.IWGSC.dna.toplevel.fa
res_path=data/res
locifile_path=data/mitesall.locifile.csv
#all sRNA and loci
cd $shortstack_path

./ShortStack --readfile \
    $data_path/21dpiR1C.trimmed.fq.gz \
    $data_path/21dpiR3C.trimmed.fq.gz \
    $data_path/21dpiR1T.trimmed.fq.gz \
    $data_path/21dpiR3T.trimmed.fq.gz \
    --genomefile $genome_path \
    --outdir $res_path/1_all \
    --sort_mem 9G \
#    --bowtie_cores 2 \
--bowtie_m all --foldsize 1000

./ShortStack \
    --bamfile $res_path/1_all/merged_alignments.bam \
    --genomefile $genome_path \
    --bowtie_m all --foldsize 1000 \
    --locifile $locifile_path \
    --sort_mem 20G \
    --outdir $res_path/1_mites
