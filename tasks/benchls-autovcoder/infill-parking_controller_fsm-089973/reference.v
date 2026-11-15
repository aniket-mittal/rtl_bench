module autovcoder_089973 (
    input gl_reset,
    input city_done,
    input parkpick_confirm,
    input parkpick,  /*park=1, pick=0*/
    input spot_entered,
    input leave  /*from vending machine*/,
    input size_entered,
    input fit,
    input car_in_done,
    input resetn,
    input clock,
    output reg read_vehicle_size,
    output reg read_park_pick,
    output reg read_spot,
    output reg read_city,
    //output reg calculate_fare,
    output [3:0] current_state_out,
    output reg go,
    output reg reverse,
    output reg change_background
);
  assign current_state_out = current_state;

  localparam  S_WAIT_USER = 4'd0,
													 S_WAIT_PARKPICK = 4'd1,	
													 S_CHOOSE_SPOT_OUT = 4'd2,
													 S_SPOT_SELF_OUT       = 4'd3,
													 S_CHOOSE_VEHICLE_SIZE = 4'd4,
													 S_CHOOSE_SPOT_IN = 4'd5,
													 S_SPOT_FIT = 4'd6,
													 S_SPOT_SELF_IN = 4'd7,
													 S_CHOOSE_CITY = 4'd8,
													 S_BACKGROUND = 4'd9;

  reg [3:0] current_state = S_CHOOSE_CITY;
  reg [3:0] next_state;

  //Next state logic aka our state table
  always @(*) begin : state_table
    case (current_state)
      S_CHOOSE_CITY: next_state = city_done ? S_BACKGROUND : S_CHOOSE_CITY;
      S_BACKGROUND: next_state = S_WAIT_USER;
      S_WAIT_USER: next_state = parkpick_confirm ? S_WAIT_PARKPICK : S_WAIT_USER;
      S_WAIT_PARKPICK: next_state = parkpick ? S_CHOOSE_VEHICLE_SIZE : S_CHOOSE_SPOT_OUT;
      S_CHOOSE_SPOT_OUT: next_state = spot_entered ? S_SPOT_SELF_OUT : S_CHOOSE_SPOT_OUT;
      S_SPOT_SELF_OUT: next_state = leave ? S_WAIT_USER : S_SPOT_SELF_OUT;
      S_CHOOSE_VEHICLE_SIZE: next_state = size_entered ? S_CHOOSE_SPOT_IN : S_CHOOSE_VEHICLE_SIZE;
      S_CHOOSE_SPOT_IN: next_state = spot_entered ? S_SPOT_FIT : S_CHOOSE_SPOT_IN;
      S_SPOT_FIT: next_state = fit ? S_SPOT_SELF_IN : S_CHOOSE_SPOT_IN;
      S_SPOT_SELF_IN: next_state = car_in_done ? S_WAIT_USER : S_SPOT_SELF_IN;
      default: next_state = S_CHOOSE_CITY;
    endcase
  end

  always @(posedge clock) begin
    if (gl_reset) begin
      current_state <= S_CHOOSE_CITY;
    end else if (resetn) begin
      current_state <= S_WAIT_USER;

    end else begin
      current_state <= next_state;
    end
  end

  always @(*) begin
    read_city = 1'b0;
    read_vehicle_size = 1'b0;
    read_park_pick = 1'b0;
    read_spot = 1'b0;
    go = 1'b0;
    reverse = 1'b0;
    change_background = 1'b0;
    //calculate_fare = 1'b0;
    case (current_state)
      S_CHOOSE_CITY: read_city = 1'b1;
      S_SPOT_FIT: read_spot = 1'b1;
      S_CHOOSE_SPOT_IN: read_vehicle_size = 1'b1;
      S_WAIT_PARKPICK: read_park_pick = 1'b1;
      S_SPOT_SELF_OUT: begin
        read_spot = 1'b1;
        //calculate_fare = 1'b1;
        go = 1'b1;
        reverse = 1'b1;
      end
      S_SPOT_SELF_IN: go = 1'b1;
      S_BACKGROUND: change_background = 1'b1;
    endcase
  end

endmodule

