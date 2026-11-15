module autovcoder_031059 (
    state,
    data_count,
    empty,
    full,
    rd_ack,
    rd_err,
    wr_ack,
    wr_err
);  //fifo_out
  input [2:0] state;  // input
  input [3:0] data_count;
  output reg empty, full, rd_ack, rd_err, wr_ack, wr_err;  // output reg

  parameter IDLE = 3'b000;  // define
  parameter WRITE = 3'b001;
  parameter READ = 3'b010;
  parameter WR_ERROR = 3'b011;
  parameter RD_ERROR = 3'b100;

  always @ (data_count)					// depend on data_count
	begin
    if(data_count==0)							// data=0, empty
			begin
      full  <= 0;
      empty <= 1;
    end
		else if(data_count==4'b1000)			// data=8, full
			begin
      full  <= 1;
      empty <= 0;
    end else begin  // otherwise, full =0, empty=0
      full  <= 0;
      empty <= 0;
    end
  end

  always @ (state)							// depend on state
	begin
    case (state)
      IDLE : 																	// when IDLE
				begin
        wr_ack <= 0;
        wr_err <= 0;
        rd_ack <= 0;
        rd_err <= 0;
      end
      WRITE : 																	// when WRITE
				begin
        wr_ack <= 1;
        wr_err <= 0;
        rd_ack <= 0;
        rd_err <= 0;
      end
      READ : 																	// when READ
				begin
        wr_ack <= 0;
        wr_err <= 0;
        rd_ack <= 1;
        rd_err <= 0;
      end
      WR_ERROR : 																// when WR_ERROR
				begin
        wr_ack <= 0;
        wr_err <= 1;
        rd_ack <= 0;
        rd_err <= 0;
      end
      RD_ERROR : 																// when RD_ERROR
				begin
        wr_ack <= 0;
        wr_err <= 0;
        rd_ack <= 0;
        rd_err <= 1;
      end
      default : 																// when default, unknown
				begin
        wr_ack <= 1'bx;
        wr_err <= 1'bx;
        rd_ack <= 1'bx;
        rd_err <= 1'bx;
      end
    endcase
  end
endmodule

