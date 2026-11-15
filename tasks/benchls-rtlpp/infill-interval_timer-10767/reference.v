module rtlpp_10767 (
    address,
    chipselect,
    clk,
    reset_n,
    write_n,
    writedata,
    irq,
    readdata
);

    output irq;
    output [15:0] readdata;
    input [2:0] address;
    input chipselect;
    input clk;
    input reset_n;
    input write_n;
    input [15:0] writedata;

    wire clk_en;
    wire control_continuous;
    wire control_interrupt_enable;
    reg [3:0] control_register;
    wire control_wr_strobe;
    reg counter_is_running;
    wire counter_is_zero;
    wire [31:0] counter_load_value;
    reg [31:0] counter_snapshot;
    reg delayed_unxcounter_is_zeroxx0;
    wire do_start_counter;
    wire do_stop_counter;
    reg force_reload;
    reg [31:0] internal_counter;
    reg [15:0] period_h_register;
    wire period_h_wr_strobe;
    reg [15:0] period_l_register;
    wire period_l_wr_strobe;
    wire [15:0] read_mux_out;
    reg [15:0] readdata;
    wire snap_h_wr_strobe;
    wire snap_l_wr_strobe;
    wire [31:0] snap_read_value;
    wire snap_strobe;
    wire start_strobe;
    wire status_wr_strobe;
    wire stop_strobe;
    wire timeout_event;
    reg timeout_occurred;

    assign clk_en = 1;

    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0) begin
            internal_counter <= 32'hC34F;
        end else if (counter_is_running || force_reload) begin
            if (counter_is_zero || force_reload) begin
                internal_counter <= counter_load_value;
            end else begin
                internal_counter <= internal_counter - 1;
            end
        end
    end

    assign counter_is_zero = internal_counter == 0;
    assign counter_load_value = {period_h_register, period_l_register};

    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0) begin
            force_reload <= 0;
        end else if (clk_en) begin
            force_reload <= period_h_wr_strobe || period_l_wr_strobe;
        end
    end

    assign do_start_counter = start_strobe;
    assign do_stop_counter = (stop_strobe) || (force_reload) || (counter_is_zero && ~control_continuous);

    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0) begin
            counter_is_running <= 1'b0;
        end else if (clk_en) begin
            if (do_start_counter) begin
                counter_is_running <= 1;
            end else if (do_stop_counter) begin
                counter_is_running <= 0;
            end
        end
    end

    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0) begin
            delayed_unxcounter_is_zeroxx0 <= 0;
        end else if (clk_en) begin
            delayed_unxcounter_is_zeroxx0 <= counter_is_zero;
        end
    end

    assign timeout_event = (counter_is_zero) & ~(delayed_unxcounter_is_zeroxx0);

    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0) begin
            timeout_occurred <= 0;
        end else if (clk_en) begin
            if (status_wr_strobe) begin
                timeout_occurred <= 0;
            end else if (timeout_event) begin
                timeout_occurred <= 1;
            end
        end
    end

    assign irq = timeout_occurred && control_interrupt_enable;

    assign read_mux_out = ({16 {(address == 2)}} & period_l_register) |
                          ({16 {(address == 3)}} & period_h_register) |
                          ({16 {(address == 4)}} & snap_read_value[15:0]) |
                          ({16 {(address == 5)}} & snap_read_value[31:16]) |
                          ({16 {(address == 1)}} & control_register) |
                          ({16 {(address == 0)}} & {counter_is_running, timeout_occurred});

    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0) begin
            readdata <= 0;
        end else if (clk_en) begin
            readdata <= read_mux_out;
        end
    end

    assign period_l_wr_strobe = chipselect && ~write_n && (address == 2);
    assign period_h_wr_strobe = chipselect && ~write_n && (address == 3);

    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0) begin
            period_l_register <= 49999;
        end else if (period_l_wr_strobe) begin
            period_l_register <= writedata;
        end
    end

    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0) begin
            period_h_register <= 0;
        end else if (period_h_wr_strobe) begin
            period_h_register <= writedata;
        end
    end

    assign snap_l_wr_strobe = chipselect && ~write_n && (address == 4);
    assign snap_h_wr_strobe = chipselect && ~write_n && (address == 5);
    assign snap_strobe = snap_l_wr_strobe || snap_h_wr_strobe;

    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0) begin
            counter_snapshot <= 0;
        end else if (snap_strobe) begin
            counter_snapshot <= internal_counter;
        end
    end

    assign snap_read_value = counter_snapshot;

    assign control_wr_strobe = chipselect && ~write_n && (address == 1);

    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 0) begin
            control_register <= 0;
        end else if (control_wr_strobe) begin
            control_register <= writedata[3:0];
        end
    end

    assign stop_strobe = writedata[3] && control_wr_strobe;
    assign start_strobe = writedata[2] && control_wr_strobe;
    assign control_continuous = control_register[1];
    assign control_interrupt_enable = control_register[0];
    assign status_wr_strobe = chipselect && ~write_n && (address == 0);

endmodule