module autovcoder_064456 (

    input lock0,
    lock1,
    lock2,
    lock3,
    clk,
    reset,
    ready,
    input [15:0] di0,
    output reg [3:0] holds = 0,
    output reg [15:0] DI = 0,
    output reg [8:0] Address = 0,
    output reg [3:0] state = 0,
    output reg done = 0,
    output reg kill = 0,
    output reg rd_drp = 0,
    output reg wr_drp = 0
);



  reg [15:0] store_di0;

  initial store_di0 = 0;
  parameter



load_addr_agc=      1,
rd_drp_agc=         2,
wait_drprdy_agc=    3,
mod_drp_agc=        4,
load_drp_agc =      5,
pulse_wr_agc=       6,
wait_drp_dy_agc=    7,
lock_agc=           8,
endstate        =   9,
resetstate      =   10;

  initial holds = 4'b0;
  initial DI = 16'b0;
  initial Address = 9'b0;
  initial wr_drp = 1'b0;
  initial rd_drp = 1'b0;
  initial done = 1'b0;


  always @(posedge clk)

    if (reset) begin
      state <= resetstate;
      holds <= 4'b0;
      DI <= 16'b0;
      Address <= 9'b0;
      wr_drp <= 1'b0;
      done <= 1'b0;
      kill <= 1'b0;

    end
else
if( (lock0==1'b1 || lock1==1'b1 || lock2==1'b1 || lock3==1'b1) && (!kill)  )
begin

      case (state)



        resetstate: begin
          state <= load_addr_agc;
          done  <= 0;
          holds <= 4'b0;
        end


        //AGC LOOP///

        load_addr_agc: begin
          Address <= 9'h01E;
          state   <= rd_drp_agc;
        end

        rd_drp_agc: begin  // Start Read Sequence Wait for DRPRDY
          rd_drp <= 1'b1;
          state  <= wait_drprdy_agc;
        end

        wait_drprdy_agc: begin  //  Wait for DRPRDY
          rd_drp <= 1'b0;
          if (ready == 1'b1) begin
            store_di0 <= di0;
            state <= mod_drp_agc;
          end else begin
            state <= wait_drprdy_agc;
          end
        end

        mod_drp_agc: begin


          if (lock0 == 1'b1 & lock1 == 1'b0 & lock2 == 1'b0 & lock3 == 1'b0) begin
            store_di0[2:0] <= 3'b011;  /// 64X
            state          <= load_drp_agc;
          end else if (lock1 == 1'b1 & lock2 == 1'b0 & lock3 == 1'b0) begin
            store_di0[2:0] <= 3'b010;  /// 16X
            state          <= load_drp_agc;
          end else if (lock2 == 1'b1 & lock3 == 1'b0) begin
            store_di0[2:0]<=3'b001;     // 4X
            state<=load_drp_agc;
          end else if (lock3 == 1'b1) begin
            store_di0[2:0] <= 3'b000;  /// 1X
            state <= load_drp_agc;
          end
        end


        load_drp_agc: begin
          state <= pulse_wr_agc;
          DI <= store_di0;
        end



        pulse_wr_agc: begin
          wr_drp <= 1'b1;
          state  <= wait_drp_dy_agc;
        end

        wait_drp_dy_agc: begin
          wr_drp <= 1'b0;
          if (ready == 1'b1) begin
            DI <= store_di0;
            state <= lock_agc;
          end
        end

        lock_agc: begin
          if (done == 1'b1) begin
            state <= endstate;
          end else if (lock0 == 1'b1 & lock1 == 1'b0) begin
            state <= mod_drp_agc;
          end else if (lock1 == 1'b1 & lock2 == 1'b0) begin
            state <= mod_drp_agc;
          end else if (lock2 == 1'b1 & lock3 == 1'b0) begin
            state <= mod_drp_agc;
          end else if (lock3 == 1'b1) begin
            state <= mod_drp_agc;
            done  <= 1'b1;
          end else state <= lock_agc;

        end

        endstate: begin
          holds <= 4'b1011;
          DI <= 16'd0;
          Address <= 9'd0;
          wr_drp <= 1'b0;
          rd_drp <= 1'b0;
          kill <= done;
        end


        default: state <= 4'bx;


      endcase

    end
endmodule

