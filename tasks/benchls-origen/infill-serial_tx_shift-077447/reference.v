module origen_077447 (
    input wire clk,
    input wire nRst,
    input wire [7:0] data,
    input wire send,
    input wire get,
    output reg tx
);

    // Parameters
    localparam LOAD = 1'b0;
    localparam SEND = 1'b1;

    // Internal registers
    reg [47:0] load;
    reg [8:0] count;
    reg state;

    // State machine and data transmission logic
    always @(posedge clk or negedge nRst) begin
        if (!nRst) begin
            load <= 48'b0;
            count <= 9'b0;
            tx <= 1'b1;
            state <= LOAD;
        end else begin
            case (state)
                LOAD: begin
                    if (get && count < 9'd48) begin
                        load <= {data, load[47:8]};
                        count <= count + 9'd8;
                    end
                    if (send && count > 9'd0) begin
                        state <= SEND;
                        tx <= 1'b0; // Start bit
                    end
                end
                SEND: begin
                    if (count > 9'd0) begin
                        tx <= load[0];
                        load <= {1'b0, load[47:1]};
                        count <= count - 9'd1;
                    end else begin
                        tx <= 1'b1; // Stop bit
                        state <= LOAD;
                    end
                end
            endcase
        end
    end

endmodule