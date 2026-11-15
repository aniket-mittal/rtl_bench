// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 288;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08943 dut (
    .Clk(clk),
    .Reset(in_vec[33:33]),
    .IO_read_data(in_vec[32:1]),
    .IO_ready(in_vec[0:0]),
    .TRACE_data_access(out_vec[287:287]),
    .TRACE_data_address(out_vec[286:255]),
    .TRACE_data_byte_enable(out_vec[254:251]),
    .TRACE_data_read(out_vec[250:250]),
    .TRACE_data_write(out_vec[249:249]),
    .TRACE_data_write_value(out_vec[248:217]),
    .TRACE_dcache_hit(out_vec[216:216]),
    .TRACE_dcache_rdy(out_vec[215:215]),
    .TRACE_dcache_read(out_vec[214:214]),
    .TRACE_dcache_req(out_vec[213:213]),
    .TRACE_delay_slot(out_vec[212:212]),
    .TRACE_ex_piperun(out_vec[211:211]),
    .TRACE_exception_kind(out_vec[210:206]),
    .TRACE_exception_taken(out_vec[205:205]),
    .TRACE_icache_hit(out_vec[204:204]),
    .TRACE_icache_rdy(out_vec[203:203]),
    .TRACE_icache_req(out_vec[202:202]),
    .TRACE_instruction(out_vec[201:170]),
    .TRACE_jump_hit(out_vec[169:169]),
    .TRACE_jump_taken(out_vec[168:168]),
    .TRACE_mb_halted(out_vec[167:167]),
    .TRACE_mem_piperun(out_vec[166:166]),
    .TRACE_msr_reg(out_vec[165:151]),
    .TRACE_new_reg_value(out_vec[150:119]),
    .TRACE_of_piperun(out_vec[118:118]),
    .TRACE_pc(out_vec[117:86]),
    .TRACE_pid_reg(out_vec[85:78]),
    .TRACE_reg_addr(out_vec[77:73]),
    .TRACE_reg_write(out_vec[72:72]),
    .TRACE_valid_instr(out_vec[71:71]),
    .IO_addr_strobe(out_vec[70:70]),
    .IO_address(out_vec[69:38]),
    .IO_byte_enable(out_vec[37:34]),
    .IO_read_strobe(out_vec[33:33]),
    .IO_write_data(out_vec[32:1]),
    .IO_write_strobe(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h24ad98cfd;
    stim[1] = 34'h3ceef32e6;
    stim[2] = 34'h18d9fda43;
    stim[3] = 34'h03c0b6278;
    stim[4] = 34'h135eab8d3;
    stim[5] = 34'h0c3654e09;
    stim[6] = 34'h1861f70d7;
    stim[7] = 34'h1933457d8;
    stim[8] = 34'h0334ad2b6;
    stim[9] = 34'h1043e5a0b;
    stim[10] = 34'h1d4ac72de;
    stim[11] = 34'h066f8f365;
    stim[12] = 34'h16251efb2;
    stim[13] = 34'h057c26de7;
    stim[14] = 34'h10ce5b377;
    stim[15] = 34'h1b7493c81;
    stim[16] = 34'h0db50c60e;
    stim[17] = 34'h1e2061698;
    stim[18] = 34'h1995276c4;
    stim[19] = 34'h0ac613a83;
    stim[20] = 34'h1f6249201;
    stim[21] = 34'h114a216ca;
    stim[22] = 34'h0c9bdbe1d;
    stim[23] = 34'h1b3f849cb;
    stim[24] = 34'h09a817b92;
    stim[25] = 34'h1e6e69903;
    stim[26] = 34'h104e81178;
    stim[27] = 34'h045951fd6;
    stim[28] = 34'h1a4358437;
    stim[29] = 34'h0727c1d97;
    stim[30] = 34'h1f8152f3a;
    stim[31] = 34'h0e6cc6112;
    stim[32] = 34'h0088af813;
    stim[33] = 34'h0a927ef06;
    stim[34] = 34'h06e398beb;
    stim[35] = 34'h06b3a16f8;
    stim[36] = 34'h05d8036d1;
    stim[37] = 34'h135c88618;
    stim[38] = 34'h1791da7a9;
    stim[39] = 34'h17864f335;
    stim[40] = 34'h16d13f0c0;
    stim[41] = 34'h1a4417136;
    stim[42] = 34'h1f1d17fee;
    stim[43] = 34'h14657bfdd;
    stim[44] = 34'h1eb2a9315;
    stim[45] = 34'h134969687;
    stim[46] = 34'h1bf30c5b2;
    stim[47] = 34'h13515726d;
    stim[48] = 34'h073093792;
    stim[49] = 34'h19daa515a;
    stim[50] = 34'h0800efd78;
    stim[51] = 34'h19cad6da2;
    stim[52] = 34'h18113c862;
    stim[53] = 34'h014ab7e8c;
    stim[54] = 34'h0f4a50730;
    stim[55] = 34'h1c2d46930;
    stim[56] = 34'h272255328;
    stim[57] = 34'h132f3f40d;
    stim[58] = 34'h0e64a4470;
    stim[59] = 34'h02be79620;
    stim[60] = 34'h084ec63a5;
    stim[61] = 34'h1d07daf0b;
    stim[62] = 34'h1da6aaeea;
    stim[63] = 34'h0381bac47;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[60] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[62] = 288'hxxxxxxxxxxxxxxxxxxfxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 288'hxxxxxxxxxxxxxxxxxx0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
