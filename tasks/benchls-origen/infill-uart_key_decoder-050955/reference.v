module origen_050955 (
    input wire clk,
    input wire rst_n,
    input wire [7:0] po_data,
    input wire rx_down,
    output reg key_state1,
    output reg key_state2,
    output reg key_state3,
    output reg key_state4
);

    reg [15:0] com1, com2, com4, com5;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            com1 <= 16'h0000;
            com2 <= 16'h0000;
            com4 <= 16'h0000;
            com5 <= 16'h0000;
            key_state1 <= 1'b0;
            key_state2 <= 1'b0;
            key_state3 <= 1'b0;
            key_state4 <= 1'b0;
        end else if (rx_down) begin
            com1 <= {po_data, com1[15:8]};
            com2 <= {po_data, com2[15:8]};
            com4 <= {po_data, com4[15:8]};
            com5 <= {po_data, com5[15:8]};

            case (com1)
                16'h4131: key_state1 <= 1'b1; // "A1"
                16'h4130: key_state1 <= 1'b0; // "A0"
                default: key_state1 <= key_state1;
            endcase

            case (com2)
                16'h4231: key_state2 <= 1'b1; // "B1"
                16'h4230: key_state2 <= 1'b0; // "B0"
                default: key_state2 <= key_state2;
            endcase

            case (com4)
                16'h4431: key_state3 <= 1'b1; // "D1"
                16'h4430: key_state3 <= 1'b0; // "D0"
                default: key_state3 <= key_state3;
            endcase

            case (com5)
                16'h4531: key_state4 <= 1'b1; // "E1"
                16'h4530: key_state4 <= 1'b0; // "E0"
                default: key_state4 <= key_state4;
            endcase
        end
    end

endmodule