// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_147813 dut (
    .sys_clk(clk),
    .sys_rst(in_vec[48:48]),
    .csr_a(in_vec[47:34]),
    .csr_we(in_vec[33:33]),
    .csr_di(in_vec[32:1]),
    .rx(in_vec[0:0]),
    .rx_irq(out_vec[32:32]),
    .csr_do(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h132e6f6e744cb;
    stim[1] = 49'h1ba97f81788f4;
    stim[2] = 49'h09187fc210fbc;
    stim[3] = 49'h066cc0971ba7d;
    stim[4] = 49'h0be637f9a75c1;
    stim[5] = 49'h028d41ee4342c;
    stim[6] = 49'h02be8ea22de4f;
    stim[7] = 49'h0944bec7e9bb6;
    stim[8] = 49'h0a276d8d11cbc;
    stim[9] = 49'h052271e72d4e8;
    stim[10] = 49'h00b0190993ad0;
    stim[11] = 49'h07476195889c5;
    stim[12] = 49'h0c82443192a31;
    stim[13] = 49'h0548052db3ce7;
    stim[14] = 49'h01795837c36bf;
    stim[15] = 49'h0df2c21551dec;
    stim[16] = 49'h02901a2417484;
    stim[17] = 49'h0dcbc3882fb9f;
    stim[18] = 49'h06ce47f1bcd26;
    stim[19] = 49'h13c6a2a353da5;
    stim[20] = 49'h0be5c6325e785;
    stim[21] = 49'h03fc2647986ba;
    stim[22] = 49'h052610d270f1b;
    stim[23] = 49'h0db08ae903614;
    stim[24] = 49'h02b97c12b4f2a;
    stim[25] = 49'h0e5be66024715;
    stim[26] = 49'h02749e2a7ed7c;
    stim[27] = 49'h01dfbda3da494;
    stim[28] = 49'h0eeec1b6e8ed7;
    stim[29] = 49'h0feb31137e44a;
    stim[30] = 49'h02203d0306448;
    stim[31] = 49'h0f01b44cb7228;
    stim[32] = 49'h0342a44d74f1d;
    stim[33] = 49'h0df1c600ed2a4;
    stim[34] = 49'h00e1cfe31b434;
    stim[35] = 49'h0b2e19e7b5230;
    stim[36] = 49'h184c9645c8975;
    stim[37] = 49'h05f7d9105dd64;
    stim[38] = 49'h0b3c8ac439d36;
    stim[39] = 49'h06041d9b111b3;
    stim[40] = 49'h00d5e802f995b;
    stim[41] = 49'h035feb49de0a8;
    stim[42] = 49'h005ef0d197561;
    stim[43] = 49'h080e5de13b14d;
    stim[44] = 49'h078fb66a8308d;
    stim[45] = 49'h056326ca71ee6;
    stim[46] = 49'h0d78f9952674f;
    stim[47] = 49'h037785a81a9e0;
    stim[48] = 49'h0d53556a1335f;
    stim[49] = 49'h00e587188cff4;
    stim[50] = 49'h1ebf0ab9f8bba;
    stim[51] = 49'h01c76aae07e4f;
    stim[52] = 49'h0b717183553d0;
    stim[53] = 49'h0d4ec473c1068;
    stim[54] = 49'h024cad6245131;
    stim[55] = 49'h0d8a25abf67c4;
    stim[56] = 49'h000503b8166e2;
    stim[57] = 49'h09228c551a1f7;
    stim[58] = 49'h06f01356c0616;
    stim[59] = 49'h0df635166914a;
    stim[60] = 49'h02a1d14363ea8;
    stim[61] = 49'h02cef54214d91;
    stim[62] = 49'h0ad66ba96b309;
    stim[63] = 49'h1f04604b69ba0;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000000;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
