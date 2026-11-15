module origen_190561(
  input clk,
  input x,
  input y,
  input ARstN,
  output reg [1:0] z
);

  reg [2:0] state, next_state;
  parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, 
            E = 3'b100, F = 3'b101, G = 3'b110, H = 3'b111;

  always @(posedge clk or negedge ARstN) begin
    if (~ARstN) begin
      state <= A;
    end
    else begin
      state <= next_state;
    end
  end

  always @(*) begin
    case (state)
      A: begin
        if (x) begin
          next_state = B;
        end
        else if (y) begin
          next_state = E;
        end
        else begin
          next_state = A;
        end
      end
      B: begin
        if (x) begin
          next_state = D;
        end
        else begin
          next_state = B;
        end
      end
      C: begin
        if (x) begin
          next_state = A;
        end
        else if (y) begin
          next_state = G;
        end
        else begin
          next_state = C;
        end
      end
      D: begin
        if (x) begin
          next_state = C;
        end
        else begin
          next_state = D;
        end
      end
      E: begin
        next_state = F;
      end
      F: begin
        next_state = B;
      end
      G: begin
        next_state = H;
      end
      H: begin
        next_state = D;
      end
      default: begin
        next_state = A;
      end
    endcase
  end

  always @(*) begin
    case (state)
      A, B, F: begin
        z = 2'b10;
      end
      D: begin
        z = 2'b00;
      end
      E, G, H: begin
        z = 2'b11;
      end
      C: begin
        z = 2'b10;
      end
      default: begin
        z = 2'b00;
      end
    endcase
  end

endmodule