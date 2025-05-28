## The following code is used to assess simulated outcomes against
## data from the Elandsfontein site (South Africa)

require(tidyverse)

## Read in Elandsfontein data

EFTM <- read.csv('elandsfonteinData/EFTM Equus d18O.csv', header = TRUE)

EFTM

## Calculations of Elandsfontein summary stats
#Standard deviation
sd <- sd(EFTM$d18O)

#Range
range <- max(EFTM$d18O) - min(EFTM$d18O)

#Amplitude
amp_est <- diff(range(EFTM$d18O)/2)

## Calculations of Elandsfontein summary stats
Ex4<-read.csv("simZebraDataEX4.csv")
Ex4_high<-Ex4 %>%  filter(model=="High") %>% drop_na()
sampleSizes<-as.numeric(nrow(EFTM)) #set sample size to EFTM sample count

#Standard deviation
size<-c()
bootstrapSD<-c()
for (i in sampleSizes) {
  for (j in c(1:100)) {
    samp <- Ex4_high %>%
      slice_sample(n = i) %>%                # Sample across full dataset
      group_by(specimen) %>%
      summarize(d18O_3 = mean(d18O_3, na.rm = TRUE), .groups = "drop")
    size<-append(size,i)
    bootstrapSD<-append(bootstrapSD,abs(sd(samp$d18O_3)))
  }
}
data<-data.frame(size,bootstrapSD)
mean(data$bootstrapSD)

ggplot(data,aes(x=as_factor(size),y=bootstrapSD)) +
  geom_hline(yintercept=3,linetype=2)+
  geom_boxplot() +
  theme_classic() +
  #ylim(c(1,4)) +
  labs(x="Sample Size (# of teeth)",y="Estimated Standard Deviation (\u{2030})") +
  theme(axis.text=element_text(size=12),axis.title=element_text(size=14))

#Range
size<-c()
bootstrapRange<-c()
for (i in sampleSizes) {
  for (j in c(1:100)) {
    samp <- Ex4_high %>%
      slice_sample(n = i) %>%                # Sample across full dataset
      group_by(specimen) %>%
      summarize(d18O_3 = mean(d18O_3, na.rm = TRUE), .groups = "drop")
        
        size <- append(size, i)
        bootstrapRange <- append(bootstrapRange, abs(diff(range(samp$d18O_3, na.rm = TRUE))))
      }
    }

data<-data.frame(size,bootstrapRange)
mean(data$bootstrapRange)

ggplot(data,aes(x=as_factor(size),y=bootstrapRange)) +
  geom_hline(yintercept=3,linetype=2)+
  geom_boxplot() +
  theme_classic() +
  labs(x="Sample Size (# of teeth)",y="Estimated Range (\u{2030})") +
  theme(axis.text=element_text(size=12),axis.title=element_text(size=14))

#Amplitude

size<-c()
bootstrapAmp<-c()
for (i in sampleSizes) {
  for (j in 1:100) {
    samp <- Ex4_high %>%
      slice_sample(n = i) %>%                # Sample across full dataset
      group_by(specimen) %>%
      summarize(d18O_3 = mean(d18O_3, na.rm = TRUE), .groups = "drop")
    
    size <- append(size, i)
    amp <- abs(diff(range(samp$d18O_3, na.rm = TRUE))) / 2  # Half-range = semi-amplitude
    bootstrapAmp <- append(bootstrapAmp, amp)
  }
}

data <- data.frame(size, bootstrapAmp)
mean(data$bootstrapAmp)

ggplot(data,aes(x=as_factor(size),y=bootstrapAmp)) +
  geom_hline(yintercept=3,linetype=2)+
  geom_boxplot() +
  #geom_point(aes(x = 32, y = amp_est), color = "purple3") +
  theme_classic() +
  ylim(c(1,4)) +
  labs(x="Sample Size (# of teeth)",y="Estimated Amplitude (\u{2030})") +
  theme(axis.text=element_text(size=12),axis.title=element_text(size=14))
