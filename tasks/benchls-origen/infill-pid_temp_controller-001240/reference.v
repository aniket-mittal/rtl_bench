module origen_001240 (
    input wire data_changing,
    input wire [11:0] data_warn,
    input wire [11:0] ds_data,
    input wire data_get_complete,
    input wire [9:0] p_para,
    input wire [9:0] i_para,
    input wire [9:0] d_para,
    output reg heater_open,
    output reg fan_open,
    output reg work_c,
    output reg [15:0] high_len
);

    reg [3:0] state;
    reg [11:0] error, prev_error;
    reg [23:0] integral;
    reg [11:0] derivative;
    reg [7:0] judge;
    
    always @(posedge data_get_complete) begin
        if (data_changing) begin
            state <= 4'd0;
            heater_open <= 1'b0;
            fan_open <= 1'b0;
            work_c <= 1'b0;
            high_len <= 16'd0;
            error <= 12'd0;
            prev_error <= 12'd0;
            integral <= 24'd0;
            derivative <= 12'd0;
            judge <= 8'd0;
        end else begin
            temp_cont();
        end
    end

    task temp_cont;
        begin
            case (state)
                4'd0: begin
                    if (data_warn > ds_data + 12'd2 || ds_data > data_warn + 12'd2) begin
                        state <= 4'd1;
                        work_c <= 1'b1;
                    end
                end
                
                4'd1: begin
                    heater_get();
                    if (ds_data > data_warn) begin
                        heater_open <= 1'b0;
                        fan_open <= 1'b1;
                    end else if (ds_data < data_warn) begin
                        heater_open <= 1'b1;
                        fan_open <= 1'b0;
                    end
                    
                    if (ds_data == data_warn || ds_data == data_warn + 12'd1 || ds_data == data_warn - 12'd1) begin
                        judge <= judge + 8'd1;
                        if (judge >= 8'd10) begin
                            state <= 4'd2;
                            judge <= 8'd0;
                        end
                    end else begin
                        judge <= 8'd0;
                    end
                end
                
                4'd2: begin
                    if (ds_data > data_warn + 12'd1 || ds_data < data_warn - 12'd1) begin
                        state <= 4'd1;
                    end else begin
                        judge <= judge + 8'd1;
                        if (judge >= 8'd20) begin
                            state <= 4'd3;
                            judge <= 8'd0;
                        end
                    end
                end
                
                4'd3: begin
                    if (ds_data > data_warn + 12'd1 || ds_data < data_warn - 12'd1) begin
                        state <= 4'd1;
                    end else begin
                        state <= 4'd0;
                        work_c <= 1'b0;
                        heater_open <= 1'b0;
                        fan_open <= 1'b0;
                    end
                end
                
                default: state <= 4'd0;
            endcase
        end
    endtask

    task heater_get;
        reg [23:0] pid_result;
        begin
            error <= data_warn - ds_data;
            integral <= integral + error;
            derivative <= error - prev_error;
            
            pid_result <= (p_para * error + i_para * integral + d_para * derivative) >> 10;
            
            if (pid_result > 24'd65535) begin
                high_len <= 16'hFFFF;
            end else begin
                high_len <= pid_result[15:0];
            end
            
            prev_error <= error;
        end
    endtask

endmodule