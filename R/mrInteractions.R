#'Wrapper to calculate and plot summed interactions of features across response variables. Bases on Greenwell et al 2018 
#'@param yhats A \code{list} is the list generated by mrIMLpredicts
#'@param X A \code{dataframe} is a response variable data set (species, OTUs, SNPs etc)
#'@param Y  A \code{dataframe} #is the feature dataset
#'@details The aim of this function is to enable users to calculate interaction importance for all fatures in a data set.
#' and then use plot_mrpd (a plotting function) to create a pd plot for all species/SNPs for each feature. 
#' Could build functionality for ICE plots but that would be messy for multiple repsonse variables.
#'@example 
#'interactions <-mrInteractions(yhats, X, Y) #this is computationally intensive so multicores are needed. If stopped prematurely - have to reload things
#'mrPlot_interactions(Interact, X,Y, top_ranking = 3, top_response=3)
#'@export

mrInteractions <- function(yhats, X, Y, model='regression'){
  
  l_response<- length(yhats)
  n_features <- names(Y)
  n_response <- names(X)
 # p <- progressr::progressor(along = yhats)

  #unpack everything from yhats
  tList <- yhats %>% purrr::map(pluck('data_train')) #get together training data.
  modList <- yhats %>% purrr::map(pluck('mod1_k'))
  dataAll <- yhats %>% purrr::map(pluck('data'))
  fitList <- yhats %>% purrr::map(pluck('last_mod_fit'))
  
  imInt <- lapply(seq(1:l_response), function(i){ #uses monte carlo CV
    imp <- modList[[i]] %>% 
     vintTidy(feature_names = n_features, train = dataAll[[i]], parallel = TRUE, model=model)
    #modified vint function - very slow over171 combinations
    
    impD <- imp$Interaction
    
    #var <-impD %>%
     # purrr::pluck("Variables")
   # p(message = sprintf("Added %g", yhats[i]))
    
  })
  
  #progress bar
  #op <- pboptions(type="timer") # default
  #system.time(res1pb <- pblapply(1:l_response, function(i) fun(imInt[,i])))
  #pboptions(op)
  
  ImpGlobal <- do.call(cbind, imInt) 
  #ImpGlobalnames <- cbind(ImpGlobal, var)
}