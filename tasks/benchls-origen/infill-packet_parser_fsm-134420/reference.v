module origen_134420 (
    input wire clk,
    input wire reset,
    input wire [7:0] in_data,
    input wire in_nd,
    output reg [7:0] out_samples,
    output reg out_samples_nd,
    output reg [7:0] out_msg,
    output reg out_msg_nd,
    output reg error
);

    reg [1:0] state;
    parameter IDLE = 2'b00, SAMPLE = 2'b01, MESSAGE = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            out_samples <= 8'b0;
            out_samples_nd <= 1'b0;
            out_msg <= 8'b0;
            out_msg_nd <= 1'b0;
            error <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (in_nd) begin
                        if (in_data == 8'hAA) begin
                            state <= SAMPLE;
                        end else if (in_data == 8'hBB) begin
                            state <= MESSAGE;
                        end else begin
                            error <= 1'b1;
                        end
                    end
                end
                SAMPLE: begin
                    if (in_nd) begin
                        out_samples <= in_data;
                        out_samples_nd <= 1'b1;
                        if (in_data == 8'hCC) begin
                            state <= IDLE;
                        end
                    end else begin
                        out_samples_nd <= 1'b0;
                    end
                end
                MESSAGE: begin
                    if (in_nd) begin
                        out_msg <= in_data;
                        out_msg_nd <= 1'b1;
                        if (in_data == 8'hDD) begin
                            state <= IDLE;
                        end
                    end else begin
                        out_msg_nd <= 1'b0;
                    end
                end
            endcase
        end
    end
endmodule

module message_stream_combiner (
    input wire clk,
    input wire reset,
    input wire [7:0] in_samples,
    input wire in_samples_nd,
    input wire [7:0] in_msg,
    input wire in_msg_nd,
    output reg [7:0] out_data,
    output reg out_nd,
    output reg error
);

    reg [1:0] state;
    parameter IDLE = 2'b00, SAMPLE = 2'b01, MESSAGE = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            out_data <= 8'b0;
            out_nd <= 1'b0;
            error <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (in_samples_nd) begin
                        state <= SAMPLE;
                        out_data <= 8'hAA;
                        out_nd <= 1'b1;
                    end else if (in_msg_nd) begin
                        state <= MESSAGE;
                        out_data <= 8'hBB;
                        out_nd <= 1'b1;
                    end else begin
                        out_nd <= 1'b0;
                    end
                end
                SAMPLE: begin
                    if (in_samples_nd) begin
                        out_data <= in_samples;
                        out_nd <= 1'b1;
                        if (in_samples == 8'hCC) begin
                            state <= IDLE;
                        end
                    end else begin
                        out_nd <= 1'b0;
                    end
                end
                MESSAGE: begin
                    if (in_msg_nd) begin
                        out_data <= in_msg;
                        out_nd <= 1'b1;
                        if (in_msg == 8'hDD) begin
                            state <= IDLE;
                        end
                    end else begin
                        out_nd <= 1'b0;
                    end
                end
            endcase
        end
    end
endmodule