module rtlpp_02706 (
    input wire                  br_taken,    

    input wire [1:0]            src_reg_used,

    input wire                  is_eret,

    input wire                  id_en,       
    input wire [4:0]            id_rd_addr,  
    input wire                  id_gpr_we_,  
    input wire [4:0]            id_mem_op,   

    input wire [6:0]            op,
    input wire [4:0]            rs1_addr,
    input wire [4:0]            rs2_addr,
    
    input wire [4:0]            id_rs1_addr,
    input wire [4:0]            id_rs2_addr,

    input wire                  ex_en,       
    input wire [4:0]            ex_rd_addr, 
    input wire                  ex_gpr_we_,  
    input wire [4:0]            ex_mem_op,   

    input wire [31:0]           mem_pc,
    input wire                  mem_en,
    input wire [3:0]            mem_exp_code,

    input wire [31:0]           mepc_i,

    output reg [31:0]           mepc_o,
    output reg [3:0]            exp_code,
    output reg                  save_exp,
    output reg                  restore_exp,

    output wire                 if_stall,    
    output wire                 id_stall,    
    output wire                 ex_stall,    
    output wire                 mem_stall,   
    
    output wire                 if_flush,    
    output wire                 id_flush,    
    output wire                 ex_flush,    
    output wire                 mem_flush,   
    output reg [31:0]           new_pc,      

    output reg [1:0]            rs1_fwd_ctrl,
    output reg [1:0]            rs2_fwd_ctrl,
    output reg                  ex_rs1_fwd_en,
    output reg                  ex_rs2_fwd_en,

    input  wire                 ic_busy,
    input  wire                 dc_busy,
    
    input  wire [1:0]           issue_id,     
    input  wire [1:0]           if_hart_id,   
    input  wire [1:0]           id_hart_id,   
    input  wire [1:0]           ex_hart_id,   
    
    input  wire                 hart_ic_stall,     
    input  wire                 hart_dc_stall,     
    input  wire                 hart_ic_flush,     
    input  wire                 hart_dc_flush,     
    
    input  wire [31:0]          if_pc,
    input  wire [31:0]          ex_pc,
    output reg                  cache_miss,     
    output reg [1:0]            cm_hart_id,     
    output reg [31:0]           cm_addr         
);

    reg     ld_hazard;       

    wire dc_flush_id;     
    wire dc_flush_ex;     
    wire dc_flush_mem;    
    
    wire br_flush_id;
    
    assign if_stall  = ld_hazard | hart_dc_stall | ic_busy | dc_busy;
    assign id_stall  = hart_dc_stall | ic_busy | dc_busy;
    assign ex_stall  = hart_dc_stall | ic_busy | dc_busy;
    assign mem_stall = ic_busy | dc_busy;

    reg    flush, eret_flush;
    assign if_flush  = flush | eret_flush;
    assign id_flush  = flush | ld_hazard | br_flush_id | dc_flush_id;
    assign ex_flush  = flush | dc_flush_ex;
    assign mem_flush = flush | dc_flush_mem | hart_dc_stall;

    assign dc_flush_id  = hart_dc_flush & (ex_hart_id == if_hart_id);
    assign dc_flush_ex  = hart_dc_flush & (ex_hart_id == id_hart_id);
    assign dc_flush_mem = hart_dc_flush;

    always @(*) begin
        cache_miss = 1'b0;
        cm_hart_id = 2'b00;
        cm_addr    = 32'h00000000;
        if (hart_dc_flush) begin
            cache_miss = 1'b1;
            cm_hart_id = ex_hart_id;
            cm_addr    = ex_pc;
        end else if (hart_ic_flush | hart_ic_stall) begin
            cache_miss = 1'b1;
            cm_hart_id = issue_id;
            cm_addr    = if_pc;
        end
    end

    assign br_flush_id = br_taken & (id_hart_id == if_hart_id);

    always @(*) begin
        if( id_en == 1'b1 && id_gpr_we_ == 1'b0 && src_reg_used[0] == 1'b1 && rs1_addr != 1'b0 && id_hart_id == if_hart_id && id_rd_addr == rs1_addr) begin
            rs1_fwd_ctrl = 2'b01;        
        end else if (ex_en == 1'b1 && ex_gpr_we_ == 1'b0 && src_reg_used[0] == 1'b1 && rs1_addr != 1'b0 && ex_hart_id == if_hart_id && ex_rd_addr == rs1_addr) begin
            rs1_fwd_ctrl = 2'b10;       
        end else begin
            rs1_fwd_ctrl = 2'b00;      
        end

        if (ex_en == 1'b1 && ex_gpr_we_ == 1'b0 && ex_mem_op[3] == 1'b1 && id_mem_op[3:2] == 2'b01 && id_rs1_addr != 1'b0 && ex_hart_id == id_hart_id && ex_rd_addr == id_rs1_addr) begin
            ex_rs1_fwd_en = 1'b1;
        end else begin
            ex_rs1_fwd_en = 1'b0;
        end

        if (id_en == 1'b1 && id_gpr_we_ == 1'b0 && src_reg_used[1] == 1'b1 && rs2_addr != 1'b0 && id_hart_id == if_hart_id && id_rd_addr == rs2_addr) begin
            rs2_fwd_ctrl = 2'b01;        
        end else if (ex_en == 1'b1 && ex_gpr_we_ == 1'b0 && src_reg_used[1] == 1'b1 && rs2_addr != 1'b0 && ex_hart_id == if_hart_id && ex_rd_addr == rs2_addr) begin
            rs2_fwd_ctrl = 2'b10;       
        end else begin
            rs2_fwd_ctrl  = 2'b00;    
        end

        if (ex_en == 1'b1 && ex_gpr_we_ == 1'b0 && ex_mem_op[3] == 1'b1 && id_mem_op[3:2] == 2'b01 && id_rs2_addr != 1'b0 && ex_hart_id == id_hart_id && ex_rd_addr == id_rs2_addr) begin
            ex_rs2_fwd_en = 1'b1;
        end else begin
            ex_rs2_fwd_en = 1'b0;
        end
    end

    always @(*) begin
        if (id_en == 1'b1 && id_gpr_we_ == 1'b0 && if_hart_id == id_hart_id && id_mem_op[3] == 1'b1 &&
            (op != 7'b1101111 || (op == 7'b1101111 && id_rd_addr == rs1_addr)) &&
            ((src_reg_used[0] == 1'b1 && id_rd_addr == rs1_addr) || (src_reg_used[1] == 1'b1 && id_rd_addr == rs2_addr))) begin
            ld_hazard = 1'b1;  
        end else begin
            ld_hazard = 1'b0; 
        end
    end

    always @(*) begin
        new_pc      = 32'h00000000;
        flush       = 1'b0;
        save_exp    = 1'b0;
        exp_code    = 4'b0000;
        mepc_o      = 32'h00000000;
        restore_exp = 1'b0;
        eret_flush  = 1'b0;

        if (mem_en == 1'b1) begin
            if (mem_exp_code != 4'b0000) begin
                new_pc   = 32'h80000000;        
                flush    = 1'b1;
                save_exp = 1'b1;
                exp_code = mem_exp_code;
                mepc_o   = mem_pc;
            end else if (is_eret) begin
                new_pc      = mepc_i;
                restore_exp = 1'b1;
                eret_flush  = 1'b1;
            end
        end
    end
endmodule