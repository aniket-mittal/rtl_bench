module autovcoder_064474 #(
    parameter clk_freq = 156250000,
    parameter timer = 1,
    parameter req_num = 256
) (
    input rst_in,
    input clk,

    input state,
    input start,

    output reg request

);


  reg [34:0] cnt;
  reg [ 9:0] err_cnt;


  //startΪ'1'£ָʱΣclk_freq*timerڣstatereq_numʱӵ'1'ʱrequestΪ'1'
  always @(posedge clk or posedge rst_in) begin
    if (rst_in) begin
      cnt <= 35'h0;
      err_cnt <= 10'h0;
      request <= 1'b0;
    end else begin
      if (start) begin
        if (cnt < (clk_freq * timer)) begin
          cnt <= cnt + 1'b1;
          if (state && (err_cnt < req_num)) begin
            err_cnt <= err_cnt + 1'b1;
          end else begin
            err_cnt <= err_cnt;
          end
        end else begin
          cnt <= 35'h0;
          err_cnt <= 10'h0;
        end

        if (err_cnt == req_num) begin
          request <= 1'b1;
        end else begin
          request <= request;
        end
      end else begin
        cnt <= 35'h0;
        err_cnt <= 10'h0;
        request <= 1'b0;
      end
    end
  end

endmodule

