// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134615 dut (
    .i_axi_clk(clk),
    .rst(in_vec[98:98]),
    .i_tear_effect(in_vec[97:97]),
    .i_fsync(in_vec[96:96]),
    .i_pixel_count(in_vec[95:64]),
    .i_axi_data(in_vec[63:32]),
    .i_axi_keep(in_vec[31:28]),
    .i_axi_last(in_vec[27:27]),
    .i_axi_valid(in_vec[26:26]),
    .i_ppfifo_rdy(in_vec[25:24]),
    .i_ppfifo_size(in_vec[23:0]),
    .o_ppfifo_clk(out_vec[36:36]),
    .o_axi_ready(out_vec[35:35]),
    .o_ppfifo_act(out_vec[34:33]),
    .o_ppfifo_stb(out_vec[32:32]),
    .o_ppfifo_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h42bfd55c2da4d700d6635ca37;
    stim[1] = 99'h69ec002192ee3cc5b574a7c81;
    stim[2] = 99'h1733231a923facbe95b30dcc0;
    stim[3] = 99'h3dcc6c574bdc8cc0898b22f56;
    stim[4] = 99'h379b96b1e7b22b1f0b9f15b8f;
    stim[5] = 99'h10ebf76ac8feb40e4b3575f49;
    stim[6] = 99'h04277db46cef35a7dad78ccc2;
    stim[7] = 99'h3d2033d2db977d5e926ce4b15;
    stim[8] = 99'h3250ede1978a91452c594c722;
    stim[9] = 99'h19093c81ffcd13197d4a8032b;
    stim[10] = 99'h33edde5db2c38fb14e1b59b81;
    stim[11] = 99'h14306aab9b0879a799b4f27fd;
    stim[12] = 99'h03078f8a36e0e7f744e00da18;
    stim[13] = 99'h1e3c3fddd6e381dfbae93a0b9;
    stim[14] = 99'h028a783871e359525c97a9d6c;
    stim[15] = 99'h1bb7e65971b04d289e5fe028d;
    stim[16] = 99'h3a7be9738c3c6f217ba1cc6e6;
    stim[17] = 99'h36781809b52953b3f376f51b8;
    stim[18] = 99'h041b1a0c06c440e5ee11459a0;
    stim[19] = 99'h273a73a8a81dd4ef70292a7a8;
    stim[20] = 99'h0e5eeda916ded2ce21705e114;
    stim[21] = 99'h35d7f1d78c865e522512009f4;
    stim[22] = 99'h371866fe51577d718067dde38;
    stim[23] = 99'h52a86203686ee49fc4eb5672a;
    stim[24] = 99'h11738651f5fe60ea9360cf64a;
    stim[25] = 99'h03f27eecf1b2a294b373f8d4d;
    stim[26] = 99'h509b165cdc0999e02d1b7a53c;
    stim[27] = 99'h372e85a43a36712b722de7e67;
    stim[28] = 99'h29938c8f0c0d340b1d273ba43;
    stim[29] = 99'h0d91d56945e1a7d37fb3895ed;
    stim[30] = 99'h351f933a96adb22a767f129a6;
    stim[31] = 99'h123361125fc40e9669a3f888d;
    stim[32] = 99'h648538ccd39385304e6ca2794;
    stim[33] = 99'h0173f69d6144a51d72b93e0e2;
    stim[34] = 99'h300b75647ceab7958c1ebfd66;
    stim[35] = 99'h157db54ee729877b3e295a0ae;
    stim[36] = 99'h3a4cdbbcdc7c29c0a7423216c;
    stim[37] = 99'h177d5f590e218422e9fffcf6f;
    stim[38] = 99'h12b73ec1c0aed62946300f95e;
    stim[39] = 99'h3e533bd21e5c018b3c7bfa46a;
    stim[40] = 99'h1cb267acb5e296268a4569db5;
    stim[41] = 99'h21080650bb42633802ecea906;
    stim[42] = 99'h3099c0b74a498cbf460c24313;
    stim[43] = 99'h3c7afe9c70ee4eac7f914471d;
    stim[44] = 99'h25958d874797a31dbb79f4194;
    stim[45] = 99'h266ea45d0ccc062081a52bb0a;
    stim[46] = 99'h0b6a1e7f572704e728100d190;
    stim[47] = 99'h39da35a4795227ba6363a6c62;
    stim[48] = 99'h28324d369bd952eb8b78164d7;
    stim[49] = 99'h3d21d84751cc39acd4dcb5c36;
    stim[50] = 99'h13d63842d748fd60d4dd1ea0d;
    stim[51] = 99'h105ed07799930a3ddd98fbf5c;
    stim[52] = 99'h30039867b5ec56a26dcff6f75;
    stim[53] = 99'h1d21716c80384ee21380be3ab;
    stim[54] = 99'h03795374920a89d0d861a4891;
    stim[55] = 99'h03ab87f0379279328de783430;
    stim[56] = 99'h3e49999f45aeb55ae1c969cee;
    stim[57] = 99'h1ca9916dc14a19be9644aed64;
    stim[58] = 99'h1109a26734e8d14545b179fa8;
    stim[59] = 99'h3c693c8507784fa63b5e93f56;
    stim[60] = 99'h37af849a84a2eff4859c11a5b;
    stim[61] = 99'h5df8f98df0b31a42ed931a984;
    stim[62] = 99'h1742d6feecf2f26918d5e061f;
    stim[63] = 99'h0be1aef44145cf10633a20783;
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
      expv[0] = 37'h0000000000;
      expv[1] = 37'h0000000000;
      expv[2] = 37'h0000000000;
      expv[3] = 37'h0000000000;
      expv[4] = 37'h0000000000;
      expv[5] = 37'h0000000000;
      expv[6] = 37'h0a00000000;
      expv[7] = 37'h03cef35a7d;
      expv[8] = 37'h00cef35a7d;
      expv[9] = 37'h00cef35a7d;
      expv[10] = 37'h00cef35a7d;
      expv[11] = 37'h00cef35a7d;
      expv[12] = 37'h00cef35a7d;
      expv[13] = 37'h04cef35a7d;
      expv[14] = 37'h04cef35a7d;
      expv[15] = 37'h0ccef35a7d;
      expv[16] = 37'h0d1b04d289;
      expv[17] = 37'h041b04d289;
      expv[18] = 37'h0c1b04d289;
      expv[19] = 37'h0c1b04d289;
      expv[20] = 37'h041b04d289;
      expv[21] = 37'h0c1b04d289;
      expv[22] = 37'h0c1b04d289;
      expv[23] = 37'h0000000000;
      expv[24] = 37'h0000000000;
      expv[25] = 37'h0000000000;
      expv[26] = 37'h0000000000;
      expv[27] = 37'h0000000000;
      expv[28] = 37'h0000000000;
      expv[29] = 37'h0000000000;
      expv[30] = 37'h0000000000;
      expv[31] = 37'h0000000000;
      expv[32] = 37'h0000000000;
      expv[33] = 37'h0000000000;
      expv[34] = 37'h0000000000;
      expv[35] = 37'h0000000000;
      expv[36] = 37'h0000000000;
      expv[37] = 37'h0400000000;
      expv[38] = 37'h0c00000000;
      expv[39] = 37'h0c00000000;
      expv[40] = 37'h0de5c018b3;
      expv[41] = 37'h055e296268;
      expv[42] = 37'h045e296268;
      expv[43] = 37'h045e296268;
      expv[44] = 37'h0c5e296268;
      expv[45] = 37'h0d797a31db;
      expv[46] = 37'h04797a31db;
      expv[47] = 37'h0c797a31db;
      expv[48] = 37'h0595227ba6;
      expv[49] = 37'h0c95227ba6;
      expv[50] = 37'h0d1cc39acd;
      expv[51] = 37'h001cc39acd;
      expv[52] = 37'h001cc39acd;
      expv[53] = 37'h001cc39acd;
      expv[54] = 37'h001cc39acd;
      expv[55] = 37'h041cc39acd;
      expv[56] = 37'h041cc39acd;
      expv[57] = 37'h041cc39acd;
      expv[58] = 37'h041cc39acd;
      expv[59] = 37'h0c1cc39acd;
      expv[60] = 37'h0d7784fa63;
      expv[61] = 37'h0000000000;
      expv[62] = 37'h0000000000;
      expv[63] = 37'h0000000000;
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
