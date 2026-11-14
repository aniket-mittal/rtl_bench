module origen_204021 (
  input clk,
  input enable,
  input [SIZE_address_pix-1:0] memstartp,
  input [SIZE_1-1:0] qp,
  output reg STOP,
  output reg [SIZE_address_pix-1:0] read_addressp,
  output reg re,
  output reg [SIZE_4-1:0] RESULT
);

parameter SIZE_1 = 8;
parameter SIZE_2 = 4;
parameter SIZE_3 = 4;
parameter SIZE_4 = 4;
parameter SIZE_address_pix = 10;

reg [SIZE_2-1:0] marker;
reg signed [SIZE_1-1:0] buff;

always @(posedge clk) begin
  if (!enable) begin
    re <= 0;
    marker <= 0;
    STOP <= 0;
  end else begin
    re <= 1;
    case (marker)
      0: begin
        buff <= qp;
        read_addressp <= memstartp + 1;
        marker <= 1;
      end
      1: begin
        buff <= 0;
        read_addressp <= memstartp + 2;
        marker <= 2;
      end
      2: begin
        if (qp > buff) begin
          buff <= qp;
          RESULT <= 1;
        end else begin
          RESULT <= 0;
        end
        read_addressp <= memstartp + 3;
        marker <= 3;
      end
      3: begin
        if (qp > buff) begin
          buff <= qp;
          RESULT <= 2;
        end else begin
          RESULT <= 0;
        end
        read_addressp <= memstartp + 4;
        marker <= 4;
      end
      4: begin
        if (qp > buff) begin
          buff <= qp;
          RESULT <= 3;
        end else begin
          RESULT <= 0;
        end
        read_addressp <= memstartp + 5;
        marker <= 5;
      end
      5: begin
        if (qp > buff) begin
          buff <= qp;
          RESULT <= 4;
        end else begin
          RESULT <= 0;
        end
        read_addressp <= memstartp + 6;
        marker <= 6;
      end
      6: begin
        if (qp > buff) begin
          buff <= qp;
          RESULT <= 5;
        end else begin
          RESULT <= 0;
        end
        read_addressp <= memstartp + 7;
        marker <= 7;
      end
      7: begin
        if (qp > buff) begin
          buff <= qp;
          RESULT <= 6;
        end else begin
          RESULT <= 0;
        end
        read_addressp <= memstartp + 8;
        marker <= 8;
      end
      8: begin
        if (qp > buff) begin
          buff <= qp;
          RESULT <= 7;
        end else begin
          RESULT <= 0;
        end
        read_addressp <= memstartp + 9;
        marker <= 9;
      end
      9: begin
        if (qp > buff) begin
          buff <= qp;
          RESULT <= 8;
        end else begin
          RESULT <= 0;
        end
        read_addressp <= memstartp + 10;
        marker <= 10;
      end
      10: begin
        if (qp > buff) begin
          buff <= qp;
          RESULT <= 9;
        end else begin
          RESULT <= 0;
        end
        read_addressp <= memstartp + 11;
        marker <= 11;
      end
      11: begin
        if (qp > buff) begin
          buff <= qp;
          RESULT <= 10;
        end else begin
          RESULT <= 0;
        end
        read_addressp <= memstartp + 12;
        marker <= 12;
      end
      12: begin
        STOP <= 1;
      end
    endcase
  end
end

endmodule