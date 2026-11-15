module autovcoder_103248 #(
    parameter AVL_DATA_WIDTH         = 32,
              DLL_DELAY_CHAIN_LENGTH = 8,
              USE_2X_DLL             = "false"

) (

    avl_writedata,
    dqse_phase

);

  input [AVL_DATA_WIDTH - 1:0] avl_writedata;

  // Arria V and Cyclone V only have dqse_phase control


  // phase decoding.
  output [3:0] dqse_phase;
  reg [3:0] dqse_phase;

  generate
    if (USE_2X_DLL == "true") begin
      always @(*) begin : decode_2x

        dqse_phase = 4'b0111;

        case (avl_writedata[2:0])
          3'b000: begin
            dqse_phase = 4'b0100;
          end
          3'b001: begin
            dqse_phase = 4'b0101;
          end
          3'b010: begin
            dqse_phase = 4'b0110;
          end
          3'b011: begin
            dqse_phase = 4'b0111;
          end
          3'b100: begin
            dqse_phase = 4'b1000;
          end
          3'b101: begin
            dqse_phase = 4'b1001;
          end
          3'b110: begin
            dqse_phase = 4'b1010;
          end
          3'b111: begin
            dqse_phase = 4'b1011;
          end
          default: begin
          end
        endcase
      end

    end else begin
      [MASKED]
    end
  endgenerate

endmodule

