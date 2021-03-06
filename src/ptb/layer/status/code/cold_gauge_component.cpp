/*
  Copyright (C) 2012 Stuffomatic Ltd. <contact@stuff-o-matic.com>

  All rights reserved.

  See the accompanying license file for details about usage, modification and
  distribution of this file.
*/
/**
 * \file
 * \brief Implementation of the ptb::cold_gauge_component class.
 * \author Sebastien Angibaud
 */
#include "ptb/layer/status/cold_gauge_component.hpp"

#include "ptb/player_signals.hpp"
#include "ptb/gauge.hpp"
#include <boost/bind.hpp>

/*----------------------------------------------------------------------------*/
/**
 * \brief Constructor.
 * \param glob Level globals in which we take the resources.
 * \param p The player from which we take the data.
 * \param active_position the position in active state.
 * \param side Indicates the side on which the component appears.
 * \param x_p The placement on x-coordinate.
 * \param y_p The placement on y-coordinate.
 * \param layer_size The size of the layer in which the component is displayed.
 */
ptb::cold_gauge_component::cold_gauge_component
( bear::engine::level_globals& glob, const player_proxy& p,
  const bear::visual::position_type& active_position,
  bear::universe::zone::position side,
  x_placement x_p, y_placement y_p,
  const bear::universe::size_box_type& layer_size )
  : super(glob, p, active_position, side, x_p, y_p, 
	  "bar (white)", "snowflake", layer_size)
{

} // cold_gauge_component::cold_gauge_component()

/*----------------------------------------------------------------------------*/
/**
 * \brief Set all signals to listen.
 */
void ptb::cold_gauge_component::init_signals()
{
  add_signal
    ( get_player().get_signals().enters_cold_zone.connect
      ( boost::bind(&ptb::gauge_component::on_enters_zone, this) ));
  
  add_signal
    ( get_player().get_signals().leaves_cold_zone.connect
      ( boost::bind(&ptb::gauge_component::on_leaves_zone, this) ));

  add_signal
    ( get_player().get_signals().cold_gauge_changed.connect
      ( boost::bind
        (&ptb::cold_gauge_component::on_cold_gauge_changed, this,_1) ) );  
} // cold_gauge_component::init_signals()

/*----------------------------------------------------------------------------*/
/**
 * \brief The fonction called when the the oxygen gauge changes.
 * \param level The level of the gauge.
 */
void ptb::cold_gauge_component::on_cold_gauge_changed(double level)
{
  if ( get_player() != NULL )
    get_gauge().set_level
      ( s_bar_length * level / 
	get_player().get_cold_gauge().get_max_value() );
} // cold_gauge_component::on_cold_gauge_changed()

