// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 38;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05164 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[37:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h10a461caf4;
    stim[1] = 37'h088cc879c8;
    stim[2] = 37'h1276617a33;
    stim[3] = 37'h0b60945961;
    stim[4] = 37'h0737aa55a9;
    stim[5] = 37'h12ac1855e5;
    stim[6] = 37'h174ddafb88;
    stim[7] = 37'h1e97fe10d5;
    stim[8] = 37'h02919bbd45;
    stim[9] = 37'h0e1f08da6e;
    stim[10] = 37'h1a07147131;
    stim[11] = 37'h0f52ec2e12;
    stim[12] = 37'h0e5f1d986a;
    stim[13] = 37'h1a8093b32f;
    stim[14] = 37'h03ac9bb3a5;
    stim[15] = 37'h03c12bfc70;
    stim[16] = 37'h1374d75eff;
    stim[17] = 37'h1e95db9ed5;
    stim[18] = 37'h1ebb215878;
    stim[19] = 37'h0b94d38c8a;
    stim[20] = 37'h13cdd93a00;
    stim[21] = 37'h179c3f98a4;
    stim[22] = 37'h0eb44f25d8;
    stim[23] = 37'h0ad18ee343;
    stim[24] = 37'h0246443b46;
    stim[25] = 37'h0f54b3d360;
    stim[26] = 37'h0f9cc3060b;
    stim[27] = 37'h0adf0eee6e;
    stim[28] = 37'h1b82dc3c51;
    stim[29] = 37'h0a9058e027;
    stim[30] = 37'h1749db8229;
    stim[31] = 37'h17b496af8e;
    stim[32] = 37'h0f154a5d4a;
    stim[33] = 37'h1ef9740f3f;
    stim[34] = 37'h17b411f2c6;
    stim[35] = 37'h0e4a9e004b;
    stim[36] = 37'h060060a9f1;
    stim[37] = 37'h0269b8448c;
    stim[38] = 37'h0e2e277202;
    stim[39] = 37'h17f77314e1;
    stim[40] = 37'h1fe8adcbbf;
    stim[41] = 37'h0ff1c49eb9;
    stim[42] = 37'h1f1d4ba39d;
    stim[43] = 37'h0a406528ce;
    stim[44] = 37'h1698c28ec1;
    stim[45] = 37'h1be3e2e87b;
    stim[46] = 37'h0f366aab80;
    stim[47] = 37'h1f727538ef;
    stim[48] = 37'h1b262a305c;
    stim[49] = 37'h0fb477de3b;
    stim[50] = 37'h0eb37dad47;
    stim[51] = 37'h1d8e2e8279;
    stim[52] = 37'h0e5fdbcc26;
    stim[53] = 37'h1f886d5df3;
    stim[54] = 37'h16696630ac;
    stim[55] = 37'h133456c03f;
    stim[56] = 37'h07fcff1ad3;
    stim[57] = 37'h17a9784648;
    stim[58] = 37'h1e81c288c7;
    stim[59] = 37'h072418bb23;
    stim[60] = 37'h0fe8f9ffa7;
    stim[61] = 37'h0f291a3f5e;
    stim[62] = 37'h0e50c67dc3;
    stim[63] = 37'h0ed599f6cd;
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
      expv[0] = 38'h0100000000;
      expv[1] = 38'h0100000000;
      expv[2] = 38'h0100000000;
      expv[3] = 38'h0100000000;
      expv[4] = 38'h0100000001;
      expv[5] = 38'h0100000000;
      expv[6] = 38'h0100000000;
      expv[7] = 38'h0100000000;
      expv[8] = 38'h0100000001;
      expv[9] = 38'h0100000000;
      expv[10] = 38'h0100000000;
      expv[11] = 38'h0100000000;
      expv[12] = 38'h0100000000;
      expv[13] = 38'h0100000000;
      expv[14] = 38'h0100000001;
      expv[15] = 38'h0100000001;
      expv[16] = 38'h0100000000;
      expv[17] = 38'h0100000000;
      expv[18] = 38'h0100000000;
      expv[19] = 38'h0100000000;
      expv[20] = 38'h0100000000;
      expv[21] = 38'h0100000000;
      expv[22] = 38'h0100000000;
      expv[23] = 38'h0100000000;
      expv[24] = 38'h0100000001;
      expv[25] = 38'h0100000000;
      expv[26] = 38'h0100000000;
      expv[27] = 38'h0100000000;
      expv[28] = 38'h0100000000;
      expv[29] = 38'h0100000000;
      expv[30] = 38'h0100000000;
      expv[31] = 38'h0100000000;
      expv[32] = 38'h0100000000;
      expv[33] = 38'h0100000000;
      expv[34] = 38'h0100000000;
      expv[35] = 38'h0100000000;
      expv[36] = 38'h0100000001;
      expv[37] = 38'h3100000031;
      expv[38] = 38'h3100000000;
      expv[39] = 38'h3100000000;
      expv[40] = 38'h3100000000;
      expv[41] = 38'h3100000000;
      expv[42] = 38'h3100000000;
      expv[43] = 38'h3100000000;
      expv[44] = 38'h3100000000;
      expv[45] = 38'h3100000000;
      expv[46] = 38'h3100000000;
      expv[47] = 38'h3100000000;
      expv[48] = 38'h3100000000;
      expv[49] = 38'h3100000000;
      expv[50] = 38'h3100000000;
      expv[51] = 38'h0100000000;
      expv[52] = 38'h0100000000;
      expv[53] = 38'h0100000000;
      expv[54] = 38'h0100000000;
      expv[55] = 38'h0100000000;
      expv[56] = 38'h0100000001;
      expv[57] = 38'h0100000000;
      expv[58] = 38'h0100000000;
      expv[59] = 38'h0100000001;
      expv[60] = 38'h0100000000;
      expv[61] = 38'h0100000000;
      expv[62] = 38'h0100000000;
      expv[63] = 38'h0100000000;
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
