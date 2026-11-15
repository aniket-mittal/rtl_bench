module rtlpp_03803(
    input start_impulse,
    input clk,
    output reg [3:0] Data_out,  // Adjusted bit-order to [3:0] for consistency
    output wire end_of_work
);

reg start_work;
reg device_in_work;
reg reset_device;
integer i;

// Initial values
initial begin
    Data_out = 4'b0000;
    start_work = 1'b0;
    device_in_work = 1'b0;
    reset_device = 1'b0;
    i = 0;
end

always @(posedge start_impulse or posedge end_of_work) begin
    if (end_of_work) begin
        start_work = 1'b0;
    end else begin
        start_work = 1'b1;
    end
end

always @(posedge clk) begin
    case (start_work)
        1: device_in_work = 1'b1;
        0: device_in_work = 1'b0;
        default: device_in_work = 1'b0;
    endcase

    if (device_in_work == 1'b1) begin
        if (i < 12) begin
            case(i)
                0: Data_out = 4'b1000;
                1: Data_out = 4'b0100;
                2: Data_out = 4'b1100;
                3: Data_out = 4'b0010;
                4: Data_out = 4'b1010;
                5: Data_out = 4'b0110;
                6: Data_out = 4'b1110;
                7: Data_out = 4'b0001;
                8: Data_out = 4'b1001;
                9: Data_out = 4'b0101;
                10: Data_out = 4'b1101;
                11: begin
                    Data_out = 4'b0000;
                    reset_device = 1'b1;
                end
                default: begin
                    Data_out = 4'b0000;
                end
            endcase
            i = i + 1;
        end else begin
            i = 0;
            device_in_work = 1'b0;
        end
    end
end

assign end_of_work = device_in_work && reset_device;

endmodule