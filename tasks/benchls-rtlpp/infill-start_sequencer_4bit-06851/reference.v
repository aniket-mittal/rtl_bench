module rtlpp_06851(
    input start_impulse, 
    input clk,
    output reg [3:0] Data_out,
    output wire end_of_work
);

reg start_work;
reg device_in_work;
reg reset_device;
integer i = 0;

// Initialize variables in an initial block
initial begin
    Data_out = 4'b0000;
    start_work = 1'b0;
    device_in_work = 1'b0;
    reset_device = 1'b0;
    i = 0;
end

always @ (posedge start_impulse or posedge end_of_work) begin
    if (end_of_work) begin
        start_work = 1'b0;
    end else begin
        start_work = 1'b1;
    end
end

always @ (posedge clk) begin
    if (start_work) begin
        device_in_work = 1'b1;
    end else begin
        device_in_work = 1'b0;
    end

    if (device_in_work == 1'b1) begin
        if (i < 13) begin
            case (i)
                0: begin
                    Data_out = 4'b1000;
                    i = i + 1;
                end
                1: begin
                    Data_out = 4'b0100;
                    i = i + 1;
                end
                2: begin
                    Data_out = 4'b1100;
                    i = i + 1;
                end
                3: begin
                    Data_out = 4'b0010;
                    i = i + 1;
                end
                4: begin
                    Data_out = 4'b1010;
                    i = i + 1;
                end
                5: begin
                    Data_out = 4'b0110;
                    i = i + 1;
                end
                6: begin
                    Data_out = 4'b1110;
                    i = i + 1;
                end
                7: begin
                    Data_out = 4'b0001;
                    i = i + 1;
                end
                8: begin
                    Data_out = 4'b1001;
                    i = i + 1;
                end
                9: begin
                    Data_out = 4'b0101;
                    i = i + 1;
                end
                10: begin
                    Data_out = 4'b1101;
                    i = i + 1;
                end
                11: begin
                    Data_out = 4'b0000;
                    reset_device = 1'b1;
                    i = i + 1;
                end
                default: begin
                    Data_out = 4'b0000;
                    i = 0;
                    reset_device = 1'b0;
                end
            endcase
        end else begin
            i = 0;
            device_in_work = 1'b0;
        end
    end
end

assign end_of_work = device_in_work && reset_device;

endmodule