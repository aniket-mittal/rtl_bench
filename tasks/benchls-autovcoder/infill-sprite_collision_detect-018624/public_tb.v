// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_018624 dut (
    .register(in_vec[63:32]),
    .data(in_vec[31:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'he70ab4a9b9c212a9;
    stim[1] = 64'h0e4d6947be3c54e6;
    stim[2] = 64'h7a6412973ac54567;
    stim[3] = 64'h9ca72f91711cac9c;
    stim[4] = 64'hba2239fe26316bc5;
    stim[5] = 64'h1cd7b2f159b05e44;
    stim[6] = 64'hf26e6aa09002c07e;
    stim[7] = 64'he081662cb854f465;
    stim[8] = 64'h275983983d647cb0;
    stim[9] = 64'hab7b35b15c595d5f;
    stim[10] = 64'hc82d083896ec4602;
    stim[11] = 64'hd3147292e92e8942;
    stim[12] = 64'hea5231f51474054f;
    stim[13] = 64'heb06bb1f2876a627;
    stim[14] = 64'heb12bd3b7f24b8cd;
    stim[15] = 64'h65bcafe5a68bc4b2;
    stim[16] = 64'h738addee7ca61010;
    stim[17] = 64'h4b11c02ee662d3e8;
    stim[18] = 64'h74fa4d2f31a47660;
    stim[19] = 64'h991507764a70b3df;
    stim[20] = 64'h425e205fa004bddd;
    stim[21] = 64'h32f6535ae2649a33;
    stim[22] = 64'h024cfdae402aa62b;
    stim[23] = 64'h253568608cce674a;
    stim[24] = 64'hdd48b21ce424ef89;
    stim[25] = 64'hb0840c65b2c69ebf;
    stim[26] = 64'hc7c51f954680a415;
    stim[27] = 64'h8b7135534ecec5be;
    stim[28] = 64'h0c34ef089f19a4b4;
    stim[29] = 64'hcbd3d81c39122842;
    stim[30] = 64'hbc74d3e4481c0502;
    stim[31] = 64'h98d95a3c313e41cc;
    stim[32] = 64'h7bee6713b502dcb6;
    stim[33] = 64'hd36d00577c61ea5e;
    stim[34] = 64'hdf6042ba7f74b12d;
    stim[35] = 64'hc624c9659a03a45a;
    stim[36] = 64'h3ad23402a16ed2f9;
    stim[37] = 64'h65a97cc1e1e32643;
    stim[38] = 64'hfb906535107aea7e;
    stim[39] = 64'h16fa968f1c648925;
    stim[40] = 64'h8f9e88442bcf9591;
    stim[41] = 64'h29b6dfda99a49ea9;
    stim[42] = 64'h0fa671e4ea997b4d;
    stim[43] = 64'hbb55da65586f3a44;
    stim[44] = 64'h8b9d2f18198e34c3;
    stim[45] = 64'h24a26e4054a605b4;
    stim[46] = 64'h97dfe7cf0ff41dcf;
    stim[47] = 64'hc1be38494a38c133;
    stim[48] = 64'haa01b64481cd2d71;
    stim[49] = 64'hd55525e83efd96d0;
    stim[50] = 64'hb4d984118b611461;
    stim[51] = 64'hc37edaf764f21310;
    stim[52] = 64'h0ff583fe43060843;
    stim[53] = 64'h2ee96e4853881afd;
    stim[54] = 64'h64090dd266c6c06e;
    stim[55] = 64'hc5a6d16299cd5faa;
    stim[56] = 64'h4248566786dd3d44;
    stim[57] = 64'h3c8966bc23af3c99;
    stim[58] = 64'h9b9b5969d5ea7864;
    stim[59] = 64'h802a8735edda14a4;
    stim[60] = 64'h386f5c705044ad33;
    stim[61] = 64'he86774d9dfd02902;
    stim[62] = 64'h726ae5e1691d66eb;
    stim[63] = 64'hdab519e0d3dfd810;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h1;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
