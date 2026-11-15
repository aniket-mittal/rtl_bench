module rtlpp_08228(
    input  clock,
    input  reset,
    input  Read,
    input  Write,
    input  [8:0] DataIn,
    output reg [16:0] DataOut,
    output Ack,
    output DataReady,
    output BootResetCPU,
    output BootWriteMem,
    output reg [17:0] BootAddr,
    output reg [31:0] BootData,
    input RxD,
    output TxD
    );

    localparam [4:0] IDLE=0, WRITE=1, READ=2, BUSW=3, XHEAD1=4, XHEAD2=5, XHEAD3=6, XSIZE1=7, XSIZE2=8, XSIZE3=9,
                     XOFST1=10, XOFST2=11, XOFST3=12, XDATA1=13, XDATA2=14, XDATA3=15, XDATA4=16, XADDRI=17;

    reg  uart_read;
    wire uart_data_ready;
    reg [7:0] uart_data_in;
    wire [7:0] uart_data_out;
    wire [8:0] uart_rx_count;
    
    reg [8:0] DataIn_r;
    wire DisableBoot = DataIn_r[8];
    reg [28:0] BootTimedEnable;
    reg BootSwEnabled;
    wire BootProtoEnabled;
    reg [17:0] rx_count;
    reg [17:0] rx_size;
    reg [4:0] state;

    always @(posedge clock) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            case (state)
                IDLE:    if (Write) state <= WRITE; 
                         else if (Read) state <= READ;
                         else if (BootProtoEnabled & uart_data_ready) state <= XHEAD1;
                         else state <= IDLE;
                         
                WRITE:   state <= BUSW;
                READ:    state <= BUSW;
                BUSW:    if (!(Read | Write)) state <= IDLE;
                XHEAD1:  if (uart_data_out == 8'h58) state <= XHEAD2;
                         else state <= IDLE;
                
                XHEAD2:  if (uart_data_ready) state <= (uart_data_out == 8'h55) ? XHEAD3 : IDLE;
                
                XHEAD3:  if (uart_data_ready) state <= (uart_data_out == 8'h4D) ? XSIZE1 : IDLE;
                
                XSIZE1:  if (uart_data_ready) state <= (uart_data_out[7:2] == 6'b000000) ? XSIZE2 : IDLE;
                XSIZE2:  if (uart_data_ready) state <= XSIZE3;
                XSIZE3:  if (uart_data_ready) state <= XOFST1;
                XOFST1:  if (uart_data_ready) state <= XOFST2;
                XOFST2:  if (uart_data_ready) state <= XOFST3;
                XOFST3:  if (uart_data_ready) state <= XDATA1;
                XDATA1:  if (uart_data_ready) state <= XDATA2;
                XDATA2:  if (uart_data_ready) state <= XDATA3;
                XDATA3:  if (uart_data_ready) state <= XDATA4;
                XDATA4:  if (uart_data_ready) state <= XADDRI;
                XADDRI:  if (rx_count == rx_size) state <= IDLE;
            endcase
        end
    end

    always @(*) begin
        case (state)
            IDLE:    uart_read <= 0;
            WRITE:   uart_read <= 0;
            READ:    uart_read <= 1;
            BUSW:    uart_read <= 0;
            XHEAD1:  uart_read <= uart_data_ready;
            XHEAD2:  uart_read <= uart_data_ready;
            XHEAD3:  uart_read <= uart_data_ready;
            XSIZE1:  uart_read <= uart_data_ready;
            XSIZE2:  uart_read <= uart_data_ready;
            XSIZE3:  uart_read <= uart_data_ready;
            XOFST1:  uart_read <= uart_data_ready;
            XOFST2:  uart_read <= uart_data_ready;
            XOFST3:  uart_read <= uart_data_ready;
            XDATA1:  uart_read <= uart_data_ready;
            XDATA2:  uart_read <= uart_data_ready;
            XDATA3:  uart_read <= uart_data_ready;
            XDATA4:  uart_read <= uart_data_ready;
            XADDRI:  uart_read <= 0;
        endcase
    end
    
    always @(posedge clock) begin
        if ((state == IDLE) && Write) DataIn_r <= DataIn;
    end
    
    always @(posedge clock) begin
        if (reset) DataOut <= 17'h00000;
        else if (state == READ) DataOut <= {uart_rx_count[8:0], uart_data_out[7:0]};
    end
    
    always @(posedge clock) begin
        if (reset) BootTimedEnable <= 29'h00000000;
        else if (BootTimedEnable != 29'h1dcd6500) BootTimedEnable <= BootTimedEnable + 1;
    end
    
    always @(posedge clock) begin
        if (reset) BootSwEnabled <= 1;
        else if (state == WRITE) BootSwEnabled <= ~DisableBoot;
    end
    
    assign BootResetCPU = ~(state == IDLE || state == WRITE || state == READ || state == BUSW || state == XHEAD1 || state == XHEAD2 || 
                           state == XHEAD3 || state == XSIZE1);
                           
    assign BootWriteMem = (state == XADDRI);
    assign uart_write = ((state == WRITE) & ~DisableBoot) || 
                        (uart_data_ready & (state == XSIZE3 || state == XDATA1 || state == XDATA2 || state == XDATA3 || state == XDATA4));
    assign uart_data_in = (state == WRITE) ? DataIn_r[7:0] : uart_data_out;
    assign Ack = (state == BUSW);
    assign DataReady = uart_data_ready;
    assign BootProtoEnabled = BootSwEnabled || (BootTimedEnable != 29'h1dcd6500);

    always @(posedge clock) begin
        if (reset) begin
            BootData <= 32'h00000000;
        end else begin
            if ((state == XDATA1) && uart_data_ready) BootData[31:24] <= uart_data_out;
            if ((state == XDATA2) && uart_data_ready) BootData[23:16] <= uart_data_out;
            if ((state == XDATA3) && uart_data_ready) BootData[15:8] <= uart_data_out;
            if ((state == XDATA4) && uart_data_ready) BootData[7:0] <= uart_data_out;
        end
    end

    always @(posedge clock) begin
        if (reset) BootAddr <= 18'h00000;
        else if (state == XADDRI) BootAddr <= BootAddr + 1;
        else begin
            if ((state == XOFST1) && uart_data_ready) BootAddr[17:16] <= uart_data_out[1:0];
            if ((state == XOFST2) && uart_data_ready) BootAddr[15:8] <= uart_data_out[7:0];
            if ((state == XOFST3) && uart_data_ready) BootAddr[7:0] <= uart_data_out[7:0];
        end
    end

    always @(posedge clock) begin
        if (state == IDLE) rx_count <= 18'h00000;
        else if (state == XADDRI) rx_count <= rx_count + 1;
    end

    always @(posedge clock) begin
        if (reset) rx_size <= 18'h00000;
        else begin
            if ((state == XSIZE1) && uart_data_ready) rx_size[17:16] <= uart_data_out[1:0];
            if ((state == XSIZE2) && uart_data_ready) rx_size[15:8] <= uart_data_out[7:0];
            if ((state == XSIZE3) && uart_data_ready) rx_size[7:0] <= uart_data_out[7:0];
        end
    end

    // UART min submodule
    reg [7:0] uart_data_out_r;
    reg uart_data_ready_r;
    
    always @(posedge clock) begin
        if (reset) begin
            uart_data_out_r <= 8'b0;
            uart_data_ready_r <= 1'b0;
        end else begin
            // Implementing UART receiver functionality
            // As an example, assume uart_data_out = RxD and uart_data_ready = 1 when data is received
            uart_data_out_r <= RxD;
            uart_data_ready_r <= 1;
        end
    end
    
    assign uart_data_out = uart_data_out_r;
    assign uart_data_ready = uart_data_ready_r;
    assign uart_rx_count = 9'b0;  // Dummy value for example only

endmodule