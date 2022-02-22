# name the portage image
FROM gentoo/portage:latest as portage

# based on stage3 image
FROM gentoo/stage3:latest

# copy the entire portage volume in
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

# sudo pw
RUN echo "root:R3tr0w0lfavi=1229" | chpasswd

# opts
ENV MAKEOPTS -j17

# continue with image build ...
RUN emerge -qv app-admin/sudo dev-vcs/git