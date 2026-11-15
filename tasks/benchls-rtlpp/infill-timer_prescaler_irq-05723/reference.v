module rtlpp_05723(
    input wire        clk_i,
    input wire        rst_i,
    input wire [7:0]  timer_control,
    input wire [15:0] timer_limit,          
    output reg [7:0]  timer_status,
    output reg [15:0] timer_count,          
    output reg        timer_disable,        
    output reg        int_o
    );

    wire              timer_enabled;
    wire              timer_single_shot;
    wire              timer_done;
    wire [2:0]        timer_pre_scale;
    reg [2:0]         timer_pre_scale_counter;
    wire              timer_pre_scale_counter_done;

    assign timer_enabled = timer_control[7];
    assign timer_single_shot = timer_control[6];
    assign timer_done = (timer_count >= timer_limit) & timer_enabled;
    assign timer_pre_scale = timer_control[2:0];
    assign timer_pre_scale_counter_done = (timer_pre_scale_counter >= timer_pre_scale);

    always @(posedge clk_i) begin
        if (rst_i)
            timer_pre_scale_counter <= 3'h0;
        else if (timer_pre_scale_counter_done)
            timer_pre_scale_counter <= 3'h0;
        else if (|timer_pre_scale & timer_enabled)
            timer_pre_scale_counter <= timer_pre_scale_counter + 1;
    end

    always @(posedge clk_i) begin
        if (rst_i)
            timer_status <= 8'h0;
        else
            timer_status <= {6'b0, timer_done, int_o};    
    end

    always @(posedge clk_i) begin
        if (rst_i)
            int_o <= 1'b0;
        else
            int_o <= timer_enabled ? timer_done : 1'b0;    
    end

    always @(posedge clk_i) begin
        if (rst_i)
            timer_disable <= 1'b0;
        else
            timer_disable <= timer_single_shot ? timer_done : 1'b0;    
    end

    always @(posedge clk_i) begin
        if (rst_i)
            timer_count <= 16'b0;
        else begin
            if (timer_enabled) begin
                if (timer_done & timer_pre_scale_counter_done)
                    timer_count <= 16'b0;
                else if (timer_pre_scale_counter_done)
                    timer_count <= timer_count + 1;
            end else
                timer_count <= 16'b0;            
        end
    end

endmodule