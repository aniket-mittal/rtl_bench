// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02086 dut (
    .clk(clk),
    .wen(in_vec[50:50]),
    .waddr(in_vec[49:44]),
    .raddr1(in_vec[43:38]),
    .raddr2(in_vec[37:32]),
    .wdata(in_vec[31:0]),
    .rdata1(out_vec[63:32]),
    .rdata2(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h01e58a99c2836;
    stim[1] = 51'h254690b2ce33d;
    stim[2] = 51'h3ec6c6159a489;
    stim[3] = 51'h65145641c31b9;
    stim[4] = 51'h036d56f3d86b7;
    stim[5] = 51'h0a7c04b094b4d;
    stim[6] = 51'h344c9772e9f46;
    stim[7] = 51'h58fd0748d164d;
    stim[8] = 51'h133953f2e4695;
    stim[9] = 51'h7622817bbbd12;
    stim[10] = 51'h2adb65efcac31;
    stim[11] = 51'h4602a36071016;
    stim[12] = 51'h526cd0cdaddd0;
    stim[13] = 51'h351908be8a9f1;
    stim[14] = 51'h42749f520c82f;
    stim[15] = 51'h5ed9e064878e5;
    stim[16] = 51'h14e1f1eece721;
    stim[17] = 51'h4371f302ba747;
    stim[18] = 51'h7667565425e1d;
    stim[19] = 51'h4277dbf1172c5;
    stim[20] = 51'h649c111bf4069;
    stim[21] = 51'h7edbd429bd684;
    stim[22] = 51'h07302b6d67ac7;
    stim[23] = 51'h68e9e101055a7;
    stim[24] = 51'h18c0886a844d0;
    stim[25] = 51'h747448599b044;
    stim[26] = 51'h56b598114fe3c;
    stim[27] = 51'h60e77a738a661;
    stim[28] = 51'h7640e7e84a4a5;
    stim[29] = 51'h0017d6ab5a0fd;
    stim[30] = 51'h079de3f378d91;
    stim[31] = 51'h4d79da3b61d15;
    stim[32] = 51'h19d076bf277c6;
    stim[33] = 51'h3065de19857a3;
    stim[34] = 51'h6236ea14c59a8;
    stim[35] = 51'h5726ab1edfc77;
    stim[36] = 51'h4ce4a9e991b0d;
    stim[37] = 51'h1e0ee8c48b10d;
    stim[38] = 51'h6f6b21156abef;
    stim[39] = 51'h7a44f7210eac4;
    stim[40] = 51'h2fc75b3fc48fc;
    stim[41] = 51'h075771b7ec003;
    stim[42] = 51'h7f3d0385535d9;
    stim[43] = 51'h7998581aa6d81;
    stim[44] = 51'h7edc10b477a57;
    stim[45] = 51'h032dd3c15172c;
    stim[46] = 51'h14955cccd18a1;
    stim[47] = 51'h17623472ffaee;
    stim[48] = 51'h708a4dc619d8f;
    stim[49] = 51'h0f5f05cf4f53f;
    stim[50] = 51'h65a0f725b8b74;
    stim[51] = 51'h4199577b43440;
    stim[52] = 51'h61d04261a7821;
    stim[53] = 51'h156f41a2e3222;
    stim[54] = 51'h7a66ca3901de0;
    stim[55] = 51'h10520c419ae87;
    stim[56] = 51'h097be7ae608d0;
    stim[57] = 51'h053e91a3ca08d;
    stim[58] = 51'h7972930f64909;
    stim[59] = 51'h7f08d989f4862;
    stim[60] = 51'h35e3f911222e8;
    stim[61] = 51'h7039f6eef75c4;
    stim[62] = 51'h3e42df6ab7239;
    stim[63] = 51'h1b8002f01f67a;
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
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'h17bbbd1217bbbd12;
      expv[11] = 64'hxxxxxxxxxxxxxxxx;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'h36071016xxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxxxxxx;
      expv[15] = 64'h17bbbd12xxxxxxxx;
      expv[16] = 64'h748d164dxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'h65425e1dxxxxxxxx;
      expv[22] = 64'hxxxxxxxxbf1172c5;
      expv[23] = 64'hxxxxxxxx429bd684;
      expv[24] = 64'hxxxxxxxx101055a7;
      expv[25] = 64'hxxxxxxxx11bf4069;
      expv[26] = 64'hxxxxxxxxxxxxxxxx;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxxxxxxxxxxxxxxx;
      expv[29] = 64'h641c31b9xxxxxxxx;
      expv[30] = 64'hxxxxxxxx429bd684;
      expv[31] = 64'h429bd684xxxxxxxx;
      expv[32] = 64'h8599b044xxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'ha3b61d15xxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'hxxxxxxxxxxxxxxxx;
      expv[37] = 64'h302ba747xxxxxxxx;
      expv[38] = 64'hxxxxxxxx0cdaddd0;
      expv[39] = 64'hxxxxxxxx1156abef;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxxb1edfc77;
      expv[42] = 64'h1156abefxxxxxxxx;
      expv[43] = 64'h36071016641c31b9;
      expv[44] = 64'hb1edfc77xxxxxxxx;
      expv[45] = 64'hxxxxxxxxxxxxxxxx;
      expv[46] = 64'h641c31b9xxxxxxxx;
      expv[47] = 64'h748d164d302ba747;
      expv[48] = 64'ha14c59a811bf4069;
      expv[49] = 64'hb1edfc77dc619d8f;
      expv[50] = 64'h101055a71156abef;
      expv[51] = 64'h36071016xxxxxxxx;
      expv[52] = 64'h8599b04411bf4069;
      expv[53] = 64'hxxxxxxxx8599b044;
      expv[54] = 64'h81aa6d819e991b0d;
      expv[55] = 64'h8599b044a738a661;
      expv[56] = 64'h0b477a570b477a57;
      expv[57] = 64'h1156abefxxxxxxxx;
      expv[58] = 64'hxxxxxxxxxxxxxxxx;
      expv[59] = 64'ha14c59a8a3b61d15;
      expv[60] = 64'h748d164d989f4862;
      expv[61] = 64'hxxxxxxxx989f4862;
      expv[62] = 64'h6eef75c4a3b61d15;
      expv[63] = 64'ha738a661a738a661;
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
