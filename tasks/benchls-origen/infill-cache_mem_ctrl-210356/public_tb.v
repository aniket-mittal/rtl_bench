// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 104;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_210356 dut (
    .i_clk(clk),
    .i_rst(in_vec[103:103]),
    .i_read_i(in_vec[102:102]),
    .i_addr_i(in_vec[101:70]),
    .i_read_d(in_vec[69:69]),
    .i_write_d(in_vec[68:68]),
    .i_byte_sel_d(in_vec[67:64]),
    .i_addr_d(in_vec[63:32]),
    .i_data_d(in_vec[31:0]),
    .o_data_i(out_vec[63:32]),
    .o_data_d(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 104'h8c904ec9349ca169d89a9cc6f8;
    stim[1] = 104'hd52f1c160ce577bc6bd25ad785;
    stim[2] = 104'h4927562d09bd9a7f3567466fa6;
    stim[3] = 104'h016aa8abf7a56af6d3f5cc8ae9;
    stim[4] = 104'h4d33f9fbb460a655be5f798a92;
    stim[5] = 104'h38c404d753c72800345585e28c;
    stim[6] = 104'h4720852c9de0bf6790bb09d238;
    stim[7] = 104'h19f660b46686228b7be106c192;
    stim[8] = 104'h3bc3b8d809052bf16f7dd0b25e;
    stim[9] = 104'h858ba6c18bed33429b0dc23bc5;
    stim[10] = 104'h13a37edad9e8aca7d070600810;
    stim[11] = 104'h43f978d257028570017da5eea9;
    stim[12] = 104'h7d96ac58e36462bcfde781a200;
    stim[13] = 104'h7e50f2470ce622f1fb72639587;
    stim[14] = 104'h7780363a28fae16c915b36c819;
    stim[15] = 104'h41b02af090812fa8449fb125d7;
    stim[16] = 104'h73a489b8a538e505080404850a;
    stim[17] = 104'h4ba7dccbed8cd0a2111bec928f;
    stim[18] = 104'h545e6b8af87fd1358ec61fb2e2;
    stim[19] = 104'h68347cdb98b23ce4f3b2d05a98;
    stim[20] = 104'h4e593d86b4d6414cc0a1dd117b;
    stim[21] = 104'hede1a7dcacf1287001f0a8f287;
    stim[22] = 104'h63c6be57ade1ea188109645920;
    stim[23] = 104'h68addc8931bf2ae41c01a5ee3a;
    stim[24] = 104'h68a81182e0eb3fa96638c6145e;
    stim[25] = 104'h3a92884f4899a9db3b91bed342;
    stim[26] = 104'h4dffa73d9fc83320c277a939c9;
    stim[27] = 104'h29c7194eab6f0d1bc741d3dc84;
    stim[28] = 104'h493ab4a6f34a04fc9eb064ed04;
    stim[29] = 104'h0684615c58cb5c14ffa5348ef6;
    stim[30] = 104'h62a9477253096999e2a85c4ef2;
    stim[31] = 104'h6e0b07ce5110d9c89a9a0efa40;
    stim[32] = 104'h57c0583e7e4ea527de015bc426;
    stim[33] = 104'h6576d45c7a7183499fc5080aeb;
    stim[34] = 104'h4b2fa6745d81a0937e9cedfa74;
    stim[35] = 104'h1a563b4e6b86359941773b8561;
    stim[36] = 104'h7c8d4b226bf5e5fe59e0f93bf9;
    stim[37] = 104'h501d2789e13cef7aca14c308a6;
    stim[38] = 104'h23ab71e184d969ebe05eb3d062;
    stim[39] = 104'h69effa6ed301d5d61a687db69a;
    stim[40] = 104'h0c3bea5292915184b50c1df0f6;
    stim[41] = 104'h15347427fe1e59f31cc8bdd369;
    stim[42] = 104'h792550166c1155e69348d05d99;
    stim[43] = 104'h6a5409ae62bb582faaa86bdcda;
    stim[44] = 104'h19e0a501c049ab14d91cc712e8;
    stim[45] = 104'h4408383768297c202270180f54;
    stim[46] = 104'he30be26c37217aceade0d7c7c1;
    stim[47] = 104'h3303f06473a5cb701392b439d4;
    stim[48] = 104'h6c9658ca7138e4c6721e060467;
    stim[49] = 104'h4904cb5942f53758782367149d;
    stim[50] = 104'h0b7331e5b36cf70223427381a3;
    stim[51] = 104'h6fbdeded7871008a977c843814;
    stim[52] = 104'h011dd2a1beea33683afbbf3a36;
    stim[53] = 104'h56f4984586de4fd787d88268e6;
    stim[54] = 104'h7501892fe0b0c66ca96bef0adc;
    stim[55] = 104'h43160ce384d888c1ec511482c3;
    stim[56] = 104'h61f6a6fd85b6f6915bb95da446;
    stim[57] = 104'h709e73001abf74537c62c4e005;
    stim[58] = 104'h7b497e89d0614b37c1508418b2;
    stim[59] = 104'h32811a3cc46ae881c0ee789ccc;
    stim[60] = 104'h643be7f83cbae04e4498d4db39;
    stim[61] = 104'h2aaa357d43bb105d3c362300d2;
    stim[62] = 104'h50c514b16657c1b6a80aa05789;
    stim[63] = 104'h47692293c21938690618409fab;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'hxxxxxxxx00000000;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'hxxxxxxxx00000000;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxxxxxx;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'hxxxxxxxxxxxxxxxx;
      expv[24] = 64'hxxxxxxxxxxxxxxxx;
      expv[25] = 64'hxxxxxxxxxxxxxxxx;
      expv[26] = 64'hxxxxxxxxxxxxxxxx;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxxxxxxxxxxxxxxx;
      expv[29] = 64'hxxxxxxxxxxxxxxxx;
      expv[30] = 64'hxxxxxxxxxxxxxxxx;
      expv[31] = 64'hxxxxxxxxxxxxxxxx;
      expv[32] = 64'hxxxxxxxxxxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'hxxxxxxxxxxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'hxxxxxxxxxxxxxxxx;
      expv[37] = 64'hxxxxxxxxxxxxxxxx;
      expv[38] = 64'hxxxxxxxxxxxxxxxx;
      expv[39] = 64'hxxxxxxxxxxxxxxxx;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxxxxxxxxxx;
      expv[42] = 64'hxxxxxxxxxxxxxxxx;
      expv[43] = 64'hxxxxxxxxxxxxxxxx;
      expv[44] = 64'hxxxxxxxxxxxxxxxx;
      expv[45] = 64'hxxxxxxxxxxxxxxxx;
      expv[46] = 64'hxxxxxxxxxxxxxxxx;
      expv[47] = 64'h0000000000000000;
      expv[48] = 64'h00000000xxxxxxxx;
      expv[49] = 64'hxxxxxxxxxxxxxxxx;
      expv[50] = 64'hxxxxxxxxxxxxxxxx;
      expv[51] = 64'hxxxxxxxxxxxxxxxx;
      expv[52] = 64'hxxxxxxxxxxxxxxxx;
      expv[53] = 64'hxxxxxxxxxxxxxxxx;
      expv[54] = 64'hxxxxxxxxxxxxxxxx;
      expv[55] = 64'hxxxxxxxxxxxxxxxx;
      expv[56] = 64'hxxxxxxxxxxxxxxxx;
      expv[57] = 64'hxxxxxxxxxxxxxxxx;
      expv[58] = 64'hxxa5eea9xxxxxxxx;
      expv[59] = 64'hxxxxxxxxxxxxxxxx;
      expv[60] = 64'hxxxxxxxxxxxxxxxx;
      expv[61] = 64'hxxxxxxxxxxxxxxxx;
      expv[62] = 64'hxxxxxxxxxxxxxxxx;
      expv[63] = 64'hxxxxxxxxxxxxxxxx;
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
