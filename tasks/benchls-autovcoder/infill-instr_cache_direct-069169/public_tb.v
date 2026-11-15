// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_069169 dut (
    .clk(clk),
    .res(in_vec[67:67]),
    .cached_instr_req(in_vec[66:66]),
    .cached_instr_adr(in_vec[65:34]),
    .instr_gnt(in_vec[33:33]),
    .instr_rvalid(in_vec[32:32]),
    .instr_read(in_vec[31:0]),
    .cached_instr_gnt(out_vec[66:66]),
    .cached_instr_rvalid(out_vec[65:65]),
    .cached_instr_read(out_vec[64:33]),
    .instr_req(out_vec[32:32]),
    .instr_adr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hf0643a59e3a9bd5a2;
    stim[1] = 68'h225de6d9ea1087985;
    stim[2] = 68'hc94e7eef51d1806b3;
    stim[3] = 68'h4b921209d6979bc62;
    stim[4] = 68'h4c9205292eb1eda35;
    stim[5] = 68'h2e6ecab89b9af484a;
    stim[6] = 68'h1c6189b47e740e954;
    stim[7] = 68'h1d29208b49ee283a1;
    stim[8] = 68'h7f69efb9d650fe6a0;
    stim[9] = 68'hbf05987d26f6b42a7;
    stim[10] = 68'h4c4bc3239f105b6f7;
    stim[11] = 68'h6d4d93183741702fe;
    stim[12] = 68'h2e1d5fc478c28c4ea;
    stim[13] = 68'h2511436c967ac5105;
    stim[14] = 68'he20f7ab19c84e1f27;
    stim[15] = 68'hfdc68e6c7120c89c9;
    stim[16] = 68'he425cf435f11475bf;
    stim[17] = 68'h70ddb12efbf2d75a5;
    stim[18] = 68'h45d16fba308000204;
    stim[19] = 68'hafca3d65005dc82ec;
    stim[20] = 68'h7f271b4d19f8a4b48;
    stim[21] = 68'h78ef18ce8645ef5df;
    stim[22] = 68'h9c8b5d6a05fa59d7c;
    stim[23] = 68'h854b1d652bfdc1bc2;
    stim[24] = 68'h066ad72033574d94a;
    stim[25] = 68'hc18ad86c502d933c2;
    stim[26] = 68'h85dc42833e48a6abb;
    stim[27] = 68'hf93219e3964686160;
    stim[28] = 68'h2d1c50de9005339c7;
    stim[29] = 68'h9b1c4bf3cfa501930;
    stim[30] = 68'h276d5661720d5001d;
    stim[31] = 68'hc438c2861d17f5256;
    stim[32] = 68'h8736510071361cc29;
    stim[33] = 68'hb20edd1014f7012e6;
    stim[34] = 68'hac3fcf72063a99442;
    stim[35] = 68'h3e03c02a8fdccbc11;
    stim[36] = 68'h80bfd64d8da41ac15;
    stim[37] = 68'h766c0b50db96e353a;
    stim[38] = 68'hf6f179f9b42a0906a;
    stim[39] = 68'hb59600fcb1277da7c;
    stim[40] = 68'h52500b70aa2b3e5b3;
    stim[41] = 68'h3372f525509d461ad;
    stim[42] = 68'hf9473e19a609ed7b6;
    stim[43] = 68'hb7f8108f466acfd3a;
    stim[44] = 68'h1d467c55151bb2de1;
    stim[45] = 68'h7e2a3976d73f9a900;
    stim[46] = 68'h18fe55f74d167bea0;
    stim[47] = 68'h25b34f15d345e0880;
    stim[48] = 68'h620f3ae1425f8bb79;
    stim[49] = 68'h71d79e3983216d801;
    stim[50] = 68'h8e8e966fe038eb44f;
    stim[51] = 68'h205c3b733493f4065;
    stim[52] = 68'h3a9cb31381ef0b345;
    stim[53] = 68'h5cd1227498280833c;
    stim[54] = 68'h1eb79e5c573b4f276;
    stim[55] = 68'h012e090fb4f6ea113;
    stim[56] = 68'h064e6e9b848ab979f;
    stim[57] = 68'hc16bf57c89f0ef196;
    stim[58] = 68'hc4b1edf2db72fb2e6;
    stim[59] = 68'h4afb60c4257259c7f;
    stim[60] = 68'h1252ff86a77f71017;
    stim[61] = 68'h4e72cfcffd0c7a29c;
    stim[62] = 68'h3bdf50b8319fa3797;
    stim[63] = 68'h5587f3274e7bce1cf;
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
      expv[0] = 67'h00000000000000000;
      expv[1] = 67'h00000000000000000;
      expv[2] = 67'h00000000000000000;
      expv[3] = 67'h00000000000000000;
      expv[4] = 67'h000000001324814a4;
      expv[5] = 67'h000000000b9bb2ae2;
      expv[6] = 67'h000000001718626d1;
      expv[7] = 67'h00000000000000000;
      expv[8] = 67'h000000000fda7bee7;
      expv[9] = 67'h000000001fc1661f4;
      expv[10] = 67'h00000000000000000;
      expv[11] = 67'h000000001b5364c60;
      expv[12] = 67'h000000000b8757f11;
      expv[13] = 67'h00000000194450db2;
      expv[14] = 67'h000000001883deac6;
      expv[15] = 67'h00000000000000000;
      expv[16] = 67'h00000000000000000;
      expv[17] = 67'h00000000000000000;
      expv[18] = 67'h0000000011745bee8;
      expv[19] = 67'h00000000000000000;
      expv[20] = 67'h00000000000000000;
      expv[21] = 67'h000000001e3bc633a;
      expv[22] = 67'h000000001722d75a8;
      expv[23] = 67'h00000000000000000;
      expv[24] = 67'h00000000000000000;
      expv[25] = 67'h00000000000000000;
      expv[26] = 67'h00000000000000000;
      expv[27] = 67'h00000000000000000;
      expv[28] = 67'h00000000000000000;
      expv[29] = 67'h00000000000000000;
      expv[30] = 67'h00000000000000000;
      expv[31] = 67'h00000000000000000;
      expv[32] = 67'h00000000000000000;
      expv[33] = 67'h00000000000000000;
      expv[34] = 67'h00000000000000000;
      expv[35] = 67'h00000000000000000;
      expv[36] = 67'h00000000000000000;
      expv[37] = 67'h00000000000000000;
      expv[38] = 67'h000000001dbc5e7e6;
      expv[39] = 67'h00000000000000000;
      expv[40] = 67'h00000000000000000;
      expv[41] = 67'h000000001cdcbd495;
      expv[42] = 67'h000000001e51cf866;
      expv[43] = 67'h00000000000000000;
      expv[44] = 67'h00000000000000000;
      expv[45] = 67'h00000000000000000;
      expv[46] = 67'h00000000163f957dd;
      expv[47] = 67'h00000000196cd3c57;
      expv[48] = 67'h000000001883ceb85;
      expv[49] = 67'h000000001c75e78e6;
      expv[50] = 67'h0000000013a3a59bf;
      expv[51] = 67'h00000000000000000;
      expv[52] = 67'h00000000000000000;
      expv[53] = 67'h00000000000000000;
      expv[54] = 67'h0000000017ade7971;
      expv[55] = 67'h00000000104b8243e;
      expv[56] = 67'h00000000000000000;
      expv[57] = 67'h00000000000000000;
      expv[58] = 67'h00000000000000000;
      expv[59] = 67'h00000000000000000;
      expv[60] = 67'h000000001494bfe1a;
      expv[61] = 67'h00000000039cb3f3f;
      expv[62] = 67'h000000001ef7d42e0;
      expv[63] = 67'h00000000000000000;
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
