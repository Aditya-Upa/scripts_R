
'''
dataset looks like this: 

3 obs 44 variables

 A tibble: 44 × 3
   Strain                                        Size GC_content
   <chr>                                        <dbl>      <dbl>
 1 Aetokthonos hydrillicola CCALA 1050           9.02       40.8
 2 Fischerella sp. PCC 9605                      8.08       42.6
 3 Fischerella sp. NIES -4106                    7.25       40.0
 4 Hapalosiphon sp. MRB220                       7.43       40.2
 5 Westiellopsis prolifica IICB1                 7.31       40.2
 6 Mastigocladus laminosus UU774                 6.7        40.7
 7 Fischerella muscicola SAG 1427-1 = PCC 73103  7.36       40.3
 8 Fischerella sp. PCC 9431                      7.17       40.2
 9 Fischerella sp. PCC 9339                      8.01       40.2
10 Fischerella muscicola CCMEE 5323              6.7        41.3
# … with 34 more rows

'''


 df <- pivot_longer(
    adi_19_4_22,
    cols = c("Size", "GC_content"),
    names_to = "Type",
    values_to = "Size"
  )
 
 '''
 pivot is used to transform the dataset such that there are two times more rows
 size and GC content are put into a new column called Type. This is done so I can make grouped bar charts.
 
 the new dataset looks like the following:
 # A tibble: 88 × 3
   Strain                              Type        Size
   <chr>                               <chr>      <dbl>
 1 Aetokthonos hydrillicola CCALA 1050 Size        9.02
 2 Aetokthonos hydrillicola CCALA 1050 GC_content 40.8 
 3 Fischerella sp. PCC 9605            Size        8.08
 4 Fischerella sp. PCC 9605            GC_content 42.6 
 5 Fischerella sp. NIES -4106          Size        7.25
 6 Fischerella sp. NIES -4106          GC_content 40.0 
 7 Hapalosiphon sp. MRB220             Size        7.43
 8 Hapalosiphon sp. MRB220             GC_content 40.2 
 9 Westiellopsis prolifica IICB1       Size        7.31
10 Westiellopsis prolifica IICB1       GC_content 40.2 
# … with 78 more rows

 '''
  p <- ggplot(df, aes(x = Strain, y = Size, fill=Type)) + 
    geom_bar(
      aes(color = Type, fill = Type) ,
      stat = "identity", position=position_dodge(1),
      width = 0.5
    ) + labs(
      y= "Genome size (MB) and GC %", x = "Strain",
      title = "Grouped Bar Chart"
    ) + 
    scale_color_manual(values = c("#0073C2FF", "#EFC000FF"))+
    scale_fill_manual(values = c("#0073C2FF", "#EFC000FF")) 
  
 p + theme(axis.text.x = element_text(size = 6, angle = 90, vjust = 0.5, hjust=1)) 
 
  
