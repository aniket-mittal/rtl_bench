module origen_026687(
    input clk,
    input [7:0] inputs,
    input reset,
    input set,
    input change,
    input shut,
    input enter1,
    input enter2,
    output reg open,
    output reg close,
    output workstatus,
    output reg [15:0] temp
);

    reg [2:0] state;
    reg [15:0] memory;
    reg [3:0] digit_count;

    parameter idle = 3'b000;
    parameter changing = 3'b001;
    parameter unlocking = 3'b010;
    parameter changed = 3'b011;
    parameter right = 3'b100;
    parameter wrong = 3'b101;

    assign workstatus = 1'b1;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            state <= idle;
            memory <= 16'h1111;
            temp <= 16'h0000;
            open <= 1'b0;
            close <= 1'b0;
            digit_count <= 4'b0000;
        end else begin
            case (state)
                idle: begin
                    if (set) state <= unlocking;
                    else if (change) state <= changing;
                    temp <= 16'h0000;
                    digit_count <= 4'b0000;
                    open <= 1'b0;
                    close <= 1'b0;
                end

                changing: begin
                    if (enter1) begin
                        if (temp == memory) state <= changed;
                        else state <= wrong;
                    end else if (|inputs) begin
                        temp <= {temp[11:0], encode_input(inputs)};
                        digit_count <= digit_count + 1;
                    end
                end

                unlocking: begin
                    if (enter1) begin
                        if (temp == memory) state <= right;
                        else state <= wrong;
                    end else if (|inputs) begin
                        temp <= {temp[11:0], encode_input(inputs)};
                        digit_count <= digit_count + 1;
                    end
                end

                changed: begin
                    if (enter2) begin
                        memory <= temp;
                        state <= idle;
                    end else if (|inputs) begin
                        temp <= {temp[11:0], encode_input(inputs)};
                        digit_count <= digit_count + 1;
                    end
                end

                right: begin
                    open <= 1'b1;
                    if (shut) state <= idle;
                end

                wrong: begin
                    close <= 1'b1;
                    if (shut) state <= idle;
                end

                default: state <= idle;
            endcase
        end
    end

    function [3:0] encode_input;
        input [7:0] button;
        casez (button)
            8'b00000001: encode_input = 4'd0;
            8'b0000001?: encode_input = 4'd1;
            8'b000001??: encode_input = 4'd2;
            8'b00001???: encode_input = 4'd3;
            8'b0001????: encode_input = 4'd4;
            8'b001?????: encode_input = 4'd5;
            8'b01??????: encode_input = 4'd6;
            8'b1???????: encode_input = 4'd7;
            default: encode_input = 4'd0;
        endcase
    endfunction

endmodule