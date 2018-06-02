## Check the power spectrum of the algorithms producing the pinkish
## noise.

library( ggplot2 )
library( climex )

## Wrapper to plot the power spectrum.
plot.spectrum <- function( x.spec, title = NULL ){
  ## The input x.spec is the output of a call to the `spectrum` or
  ## `psd::pspectrum` function.
  x.df <- data.frame( x = x.spec$freq, y = x.spec$spec )

  gg1 <- ggplot( data = x.df, aes( x = x, y = y ) ) +
    geom_line( color = "navy" ) +
    geom_smooth( method = 'gam', formula = y ~ s( x, bs = 'cs' ),
                color = "darkorange", fill = "darkorange",
                alpha = .3 ) +
    theme_bw() +
    scale_y_log10() + scale_x_log10()
  if ( !is.null( title ) ){
    gg1 <- gg1 + ggtitle( title )
  }
  return( gg1 )
}

## Generate some white and pink noise in R as a reference.
R.white <- rnorm( 48000 )

## Import the generated noise
voss.noise <- as.numeric(
    read.csv( "./voss.noise", header = F )[ , 1 ] )

## There is no true sampling frequency involved in here.
frequency.sampling <- 1
voss.spectrum <- spectrum( ts( voss.noise,
                              frequency = frequency.sampling ),
                          plot = FALSE )
R.white.spectrum <- spectrum( ts( R.white,
                                 frequency = frequency.sampling )
                           , plot = FALSE )

## Plotting the spectra
ps.R.white <- plot.spectrum( R.white.spectrum,
                            "R reference spectrum - white" )
ps.voss <- plot.spectrum( voss.spectrum, "Default Voss spectrum" )

multiplot( plotlist = list( ps.R.white, ps.voss ) )
