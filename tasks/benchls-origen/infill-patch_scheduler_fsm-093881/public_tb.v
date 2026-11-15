// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_093881 dut (
    .clk(clk),
    .rst_n(in_vec[35:35]),
    .we_pixel_size_MC(in_vec[34:34]),
    .init_mem_fin_MC(in_vec[33:33]),
    .patch_out_done_MC(in_vec[32:32]),
    .pixel_size_MC(in_vec[31:0]),
    .load_start_PD(out_vec[34:34]),
    .load_done_PD(out_vec[33:33]),
    .pixel_id_PD(out_vec[32:1]),
    .load_done_term_MC(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h48db009ff;
    stim[1] = 36'h639171959;
    stim[2] = 36'h8d104e723;
    stim[3] = 36'hedde90b8c;
    stim[4] = 36'hb7c386d9b;
    stim[5] = 36'hbe4df3d34;
    stim[6] = 36'hc7efc355c;
    stim[7] = 36'hff6f6a396;
    stim[8] = 36'hc424c3a0f;
    stim[9] = 36'h855abdad6;
    stim[10] = 36'h8123febc3;
    stim[11] = 36'hf8347130a;
    stim[12] = 36'hed412ccbd;
    stim[13] = 36'ha01dba20b;
    stim[14] = 36'hdef04d3d6;
    stim[15] = 36'hd2ab8dbfa;
    stim[16] = 36'h88b377c16;
    stim[17] = 36'h8e713e8c2;
    stim[18] = 36'ha646e60ce;
    stim[19] = 36'ha574a0fa8;
    stim[20] = 36'hce6601e3d;
    stim[21] = 36'hb4178ef57;
    stim[22] = 36'h90e06009e;
    stim[23] = 36'he78873163;
    stim[24] = 36'h8b622326f;
    stim[25] = 36'hfff80976b;
    stim[26] = 36'h9c018d84b;
    stim[27] = 36'hf70c2581c;
    stim[28] = 36'hc84deda32;
    stim[29] = 36'hb88816993;
    stim[30] = 36'h8747b2533;
    stim[31] = 36'h8c9cd1027;
    stim[32] = 36'hb5e869ec9;
    stim[33] = 36'hb790b2208;
    stim[34] = 36'hdad62f8cc;
    stim[35] = 36'hfa7aa056d;
    stim[36] = 36'hc81f5220a;
    stim[37] = 36'ha4f1bea8d;
    stim[38] = 36'hc4cdb6fb0;
    stim[39] = 36'he4a0eaa6c;
    stim[40] = 36'h814035341;
    stim[41] = 36'hec65059ae;
    stim[42] = 36'h890a0223a;
    stim[43] = 36'h85661d89c;
    stim[44] = 36'h84dc362e6;
    stim[45] = 36'h991bb3038;
    stim[46] = 36'h853436390;
    stim[47] = 36'he2fc4ada5;
    stim[48] = 36'hf693de5f8;
    stim[49] = 36'hd07d50b7b;
    stim[50] = 36'hccd86d002;
    stim[51] = 36'he5df9f9e9;
    stim[52] = 36'ha6ab20672;
    stim[53] = 36'h936b371a1;
    stim[54] = 36'hfc458eb80;
    stim[55] = 36'h90d14b2f3;
    stim[56] = 36'hd0b15b6e3;
    stim[57] = 36'he700459ed;
    stim[58] = 36'haca6e1ffd;
    stim[59] = 36'ha9a37e570;
    stim[60] = 36'hda1d7346d;
    stim[61] = 36'hda7316b42;
    stim[62] = 36'h8e2827b00;
    stim[63] = 36'hf5dd074c3;
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
      expv[0] = 35'h000000000;
      expv[1] = 35'h000000000;
      expv[2] = 35'h000000000;
      expv[3] = 35'h000000000;
      expv[4] = 35'h400000000;
      expv[5] = 35'h400000002;
      expv[6] = 35'h400000004;
      expv[7] = 35'h400000006;
      expv[8] = 35'h400000008;
      expv[9] = 35'h40000000a;
      expv[10] = 35'h40000000c;
      expv[11] = 35'h40000000e;
      expv[12] = 35'h400000010;
      expv[13] = 35'h400000012;
      expv[14] = 35'h400000014;
      expv[15] = 35'h400000016;
      expv[16] = 35'h400000018;
      expv[17] = 35'h40000001a;
      expv[18] = 35'h40000001c;
      expv[19] = 35'h40000001e;
      expv[20] = 35'h400000020;
      expv[21] = 35'h400000022;
      expv[22] = 35'h400000024;
      expv[23] = 35'h400000026;
      expv[24] = 35'h400000028;
      expv[25] = 35'h40000002a;
      expv[26] = 35'h40000002c;
      expv[27] = 35'h40000002e;
      expv[28] = 35'h400000030;
      expv[29] = 35'h400000032;
      expv[30] = 35'h400000034;
      expv[31] = 35'h400000036;
      expv[32] = 35'h400000038;
      expv[33] = 35'h40000003a;
      expv[34] = 35'h40000003c;
      expv[35] = 35'h40000003e;
      expv[36] = 35'h000000040;
      expv[37] = 35'h000000040;
      expv[38] = 35'h000000040;
      expv[39] = 35'h000000040;
      expv[40] = 35'h000000040;
      expv[41] = 35'h000000040;
      expv[42] = 35'h000000040;
      expv[43] = 35'h000000040;
      expv[44] = 35'h000000040;
      expv[45] = 35'h000000040;
      expv[46] = 35'h400000040;
      expv[47] = 35'h400000042;
      expv[48] = 35'h400000044;
      expv[49] = 35'h400000046;
      expv[50] = 35'h400000048;
      expv[51] = 35'h40000004a;
      expv[52] = 35'h40000004c;
      expv[53] = 35'h40000004e;
      expv[54] = 35'h400000050;
      expv[55] = 35'h400000052;
      expv[56] = 35'h400000054;
      expv[57] = 35'h400000056;
      expv[58] = 35'h400000058;
      expv[59] = 35'h40000005a;
      expv[60] = 35'h40000005c;
      expv[61] = 35'h40000005e;
      expv[62] = 35'h400000060;
      expv[63] = 35'h400000062;
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
